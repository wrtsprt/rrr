class ReadModeController < ApplicationController
  def index
    @items = FeedItem.all
  end
end
