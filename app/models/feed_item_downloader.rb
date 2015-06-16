class FeedItemDownloader

  def self.cache_feed(subscription)
    url = subscription.feed_url

    on_success = Proc.new do |url, feed|
      feed.entries.each do |entry|
        feed_item = FeedItem.find_by_url(entry.url)
        Rails.logger.debug "=> processing #{entry.url}"
        if feed_item.nil?
          feed_item = FeedItem.new(
                           subscription: subscription,
                           title:        entry.title,
                           url:          entry.url,
                           published_at: entry.published.to_s,
                           content:      entry.summary
                           )
          feed_item.save
        end
      end
    end

    on_failure = Proc.new do |curl, err|
      Rails.logger.error "Fetching the feed went wrong; #{curl}, #{err}"
      begin
        subscription.subscription_notifications << SubscriptionNotification.create!(type: :feed_not_downloadable, body: 'The feed_url was not reachable')
        subscription.save!
      rescue e
        Rails.logger.error e
        raise e
      end
    end

    Feedjira::Feed.fetch_and_parse(url, on_success: on_success, on_failure: on_failure)
  end

end
