class Subscription < ActiveRecord::Base
  has_many :feed_items
  has_many :subscription_notifications, dependent: :destroy

  def refresh(limit = 10)
    FeedItemDownloader.cache_feed(self)
  end
end
