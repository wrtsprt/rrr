class ReadModeController < ApplicationController
  def index
    @items = FeedItem.where(read: false).order(:id)
  end

  def mark_item_as_read
    FeedItem.where(read: false).order(:id)[params[:article_id].to_i].update_attributes read: true
    render text: 'very well than'
  end
end
