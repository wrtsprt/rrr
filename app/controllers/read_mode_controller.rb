class ReadModeController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @items = FeedItem.where(read: false).order(published_at: :asc)

    if params[:tag].present?

      @tag = params[:tag] || ""

    end
  end

  def mark_item_as_read
    if FeedItem.find(params[:article_id]).update_attributes read: true
      render text: 'very well than'
    else
      render text: 'no soo good'
    end
  end

  def get
    limit = if params[:number].present?
      number = params[:number].to_i
      number > 10 ? 10 : number
    else
      5
    end

    subscription_query= Subscription.where('1 == 1')
    if params[:tag].present?
      subscription_query = subscription_query.tagged_with(params[:tag])
    end

    feed_item_query = FeedItem.unread
    if params[:tag].present?
      subscription_ids = Subscription.tagged_with(params[:tag]).ids
      feed_item_query = feed_item_query.where(subscription_id: subscription_ids)
    end
    @items = feed_item_query.order(published_at: :asc).limit(limit)


    @items_representation = @items.map do |item|
      representation = {
          title: item.title,
          published_at: item.published_at,
          id: item.id,
          url: item.url,
          content: item.sanitized_content,
          subscription_name: item.subscription.name
      }
      representation
    end

    response = { count: @items_representation.count, items: @items_representation }
    respond_to do |format|
      format.json { render :json => response.to_json }
    end
  end

  def stats
    subscription_query= Subscription.where('1 == 1')
    if params[:tag].present?
      subscription_query = subscription_query.tagged_with(params[:tag])
    end

    feed_item_query = FeedItem.unread
    if params[:tag].present?
      subscription_ids = Subscription.tagged_with(params[:tag]).ids
      feed_item_query = feed_item_query.where(subscription_id: subscription_ids)
    end
    @unread_count = feed_item_query.count

    respond_to do |format|
      format.json { render :json => { count: @unread_count }  }
    end
  end

end
