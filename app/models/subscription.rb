class Subscription < ActiveRecord::Base
  has_many :subscription_notifications
end
