class AddReadStatusToFeedItems < ActiveRecord::Migration
  def change
    add_column :feed_items, :read, :boolean, default: false
  end
end
