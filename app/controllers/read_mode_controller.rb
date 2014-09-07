class ReadModeController < ApplicationController
  def index
    @items = FeedItem.where(read: false).order(published_at: :asc)
  end

  def mark_item_as_read
    render text: 'very well than'
  end
end
