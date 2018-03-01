class CreateSubscriptionNotifications < ActiveRecord::Migration[4.2]
  def change
    create_table :subscription_notifications do |t|
      t.string :type
      t.text :body
      t.belongs_to :subscription

      t.timestamps
    end
  end
end
