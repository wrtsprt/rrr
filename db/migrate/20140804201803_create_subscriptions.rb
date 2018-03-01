class CreateSubscriptions < ActiveRecord::Migration[4.2]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.string :feed_url
      t.string :http_url

      t.timestamps
    end
  end
end
