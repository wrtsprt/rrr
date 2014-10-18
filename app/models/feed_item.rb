class FeedItem < ActiveRecord::Base
  scope :unread, -> { where(read: false) }
  scope :read, -> { where(read: true) }
end
