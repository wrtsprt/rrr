class ImproveSanitizationController < ApplicationController
  def show
    @item = FeedItem.first
  end
end
