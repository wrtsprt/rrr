class FeedItemController < ApplicationController
  layout false

  def show
    @item = FeedItem.find(params[:id])
  end

  def clean
  end
end
