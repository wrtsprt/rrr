class CreateFeedItems < ActiveRecord::Migration[4.2]
  def change
    create_table :feed_items do |t|
      t.string :feed
      t.string :title
      t.string :url
      t.timestamp :published_at

      t.timestamps
    end
  end
end
