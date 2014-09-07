class ImproveSanitizationController < ApplicationController
  def show
    @item = FeedItem.first
    @cleaned = HtmlSanitizer.clean @item.content
    @relaxed = HtmlSanitizer.relaxed @item.content
  end
end
