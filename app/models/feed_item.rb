class FeedItem < ActiveRecord::Base
  belongs_to :subscription

  scope :unread, -> { where(read: false) }
  scope :read, -> { where(read: true) }
end
