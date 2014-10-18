class ReadModeController < ApplicationController
  def index
    @items = FeedItem.where(read: false).order(published_at: :asc)
  end

  def mark_item_as_read
    if FeedItem.find(params[:article_id]).update_attributes read: true
      render text: 'very well than'
    else
      render text: 'no soo good'
    end
  end

  def get
    @items = FeedItem.where(read: false).order(published_at: :asc).limit(1)
    respond_to do |format|
      format.json { render :json => @items.to_json }
    end
  end

  def stats
    @unread_count = FeedItem.unread.count
    respond_to do |format|
      format.json { render :json => { count: @unread_count }  }
    end
  end

end
