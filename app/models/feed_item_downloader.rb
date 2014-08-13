class FeedItemDownloader



  def self.cache_feed(url)
    on_success = Proc.new do |url, feed|
      feed.entries.each do |entry|
        feed_item = FeedItem.find_by_url(entry.url)
        Rails.logger.debug "=> processing #{entry.url}"
        if feed_item.nil?
          raw_content = open(entry.url).read
          sanitized_content = Nokogiri::HTML(raw_content).text

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
    end

    Feedjira::Feed.fetch_and_parse(url, on_success: on_success, on_failure: on_failure)
  end

end
