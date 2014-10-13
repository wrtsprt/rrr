class ReadModeController < ApplicationController
  def index
    @items = FeedItem.where(read: false).order(published_at: :asc)
  end

  def mark_item_as_read
    render text: 'very well than'
  end

  def get
    @items = FeedItem.where(read: false).order(published_at: :asc).limit(1)
    respond_to do |format|
      format.json { render :json => @items.to_json }
    end
  end
end
