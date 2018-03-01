class AddSanitizedContentColumnToFeedItems < ActiveRecord::Migration[4.2]
  def change
    add_column :feed_items, :sanitized_content, :text
  end
end
