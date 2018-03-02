class AddReadStatusToFeedItems < ActiveRecord::Migration[4.2]
  def change
    add_column :feed_items, :read, :boolean, default: false
  end
end
