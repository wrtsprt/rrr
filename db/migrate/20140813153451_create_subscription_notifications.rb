class CreateSubscriptionNotifications < ActiveRecord::Migration
  def change
    create_table :subscription_notifications do |t|
      t.string :type
      t.text :body
      t.belongs_to :subscription

      t.timestamps
    end
  end
end
