class FeedItemDownloader

  def self.cache_feed(subscription)
    url = subscription.feed_url

    feed_xml = Typhoeus.get(url, followlocation: true).response_body
    begin
      feed = Feedjira::Feed.parse feed_xml

      feed.entries.each do |entry|
        feed_item = FeedItem.find_by_url(entry.url)
        Rails.logger.debug "=> processing #{entry.url}"
        if feed_item.nil?
          feed_item = FeedItem.new(
                           subscription: subscription,
                           title:        entry.title,
                           url:          entry.url,
                           published_at: entry.published.to_s,
                           content:      entry.summary,
                           sanitize_content: FeedItemDownloader.sanitize_content(entry.summary)
                           )
          feed_item.save
        end
      end
    rescue Exception => e
      Rails.logger.error "Error fetching for subscription #{subscription.id}"
      Rails.logger.error "#{subscription.name}: #{url}"
      Rails.logger.error e

      message = "Error fetching for subscription #{subscription.id}\n"
      message += "#{subscription.name}: #{url}\n"
      message += "#{e.message}\n"
      message += "#{e.backtrace}\n"

      subscription.subscription_notifications.create!(body: message)
    end
  end

  def self.sanitize_content(dangerous_content)
    scrubber = Rails::Html::TargetScrubber.new
    scrubber.tags = ['style']

    html_fragment = Loofah.fragment(dangerous_content)
    html_fragment.scrub!(scrubber)
    html_fragment.to_s # => "<a></a>"
  end

end
