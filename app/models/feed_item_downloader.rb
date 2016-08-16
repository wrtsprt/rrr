class FeedItemDownloader

  def self.cache_feed(subscription)
    url = subscription.feed_url

    feed_xml = Typhoeus.get(url, followlocation: true).response_body
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
                         content:      entry.summary
                         )
        feed_item.save
      end
    end
  end

end
