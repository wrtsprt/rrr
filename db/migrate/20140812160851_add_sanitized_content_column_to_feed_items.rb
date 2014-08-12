class AddSanitizedContentColumnToFeedItems < ActiveRecord::Migration
  def change
    add_column :feed_items, :sanitized_content, :text
  end
end
