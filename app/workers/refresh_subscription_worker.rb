class RefreshSubscriptionWorker
  include Sidekiq::Worker

  def perform(subscription_id)
    begin
      subscription = Subscription.find subscription_id
      FeedItemDownloader.cache_feed(subscription)
    rescue Exception => e
      Rails.logger.error "Error refreshing subscription #{subscription_id}"
      Rails.logger.error e

      if subscription
        url = subscription.feed_url
        message = "Error fetching for subscription #{subscription.id}\n"
        message += "#{subscription.name}: #{url}\n"
        message += "#{e.message}\n"
        message += "#{e.backtrace}\n"

        subscription.subscription_notifications.create!(body: message)
      end
    end
  end
end
