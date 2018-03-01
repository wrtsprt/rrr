class AddContentToFeedItem < ActiveRecord::Migration[4.2]
  def change
    add_column :feed_items, :content, :text
  end
end
