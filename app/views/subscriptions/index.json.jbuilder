json.array!(@subscriptions) do |subscription|
  json.extract! subscription, :id, :name, :feed_url, :http_url
  json.url subscription_url(subscription, format: :json)
end
