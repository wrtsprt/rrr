class LinkFeedItemsToSubscriptions < ActiveRecord::Migration[4.2]
  def change
    remove_column :feed_items, :feed, :text

    add_belongs_to :feed_items, :subscription
  end
end
