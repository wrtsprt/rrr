class LinkFeedItemsToSubscriptions < ActiveRecord::Migration
  def change
    remove_column :feed_items, :feed, :text

    add_belongs_to :feed_items, :subscription
  end
end
