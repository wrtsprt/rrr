class FeedItemDownloader

  def self.cache_feed(url)
    raise 'feed is empty' if url.blank?
    feed = Feedjira::Feed.fetch_and_parse(url)

    feed.entries.each do |entry|
      feed_item = FeedItem.find_by_url(entry.url)
      Rails.logger.debug "=> processing #{entry.url}"
      if feed_item.nil?
        feed_item = FeedItem.new(
                         feed:         url,
                         title:        entry.title,
                         url:          entry.url,
                         published_at: entry.published.to_s,
                         created_at:   Time.now.to_s,
                         content:      open(entry.url).read
                         )
        feed_item.save
      end
    end
  end

end
