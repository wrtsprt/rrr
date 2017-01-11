class Subscription < ActiveRecord::Base
  has_many :feed_items, dependent: :destroy
  has_many :subscription_notifications, dependent: :destroy

  acts_as_taggable

  def refresh(limit = 10)
    FeedItemDownloader.cache_feed(self)
  end
end
