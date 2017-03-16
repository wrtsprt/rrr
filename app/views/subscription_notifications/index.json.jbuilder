json.array!(@subscription_notifications) do |subscription_notification|
  json.extract! subscription_notification, :id
  json.url subscription_notification_url(subscription_notification, format: :json)
end
