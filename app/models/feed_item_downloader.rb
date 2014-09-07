class FeedItemDownloader

  def self.cache_feed(subscription)
    url = subscription.feed_url

    on_success = Proc.new do |url, feed|
      feed.entries.each do |entry|
        feed_item = FeedItem.find_by_url(entry.url)
        Rails.logger.debug "=> processing #{entry.url}"
        if feed_item.nil?
          raw_content = open(entry.url).read
          sanitized_content = HtmlSanitizer.clean(raw_content)

          feed_item = FeedItem.new(
                           feed:         url,
                           title:        entry.title,
                           url:          entry.url,
                           published_at: entry.published.to_s,
                           created_at:   Time.now.to_s,
                           content:      raw_content,
                           sanitized_content: sanitized_content
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
