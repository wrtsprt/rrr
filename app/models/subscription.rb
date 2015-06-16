class Subscription < ActiveRecord::Base
  has_many :feed_items
  has_many :subscription_notifications, dependent: :destroy
end
