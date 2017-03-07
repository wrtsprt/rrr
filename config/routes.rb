Rails.application.routes.draw do
  get 'feed_item/show/:id' => 'feed_item#show', as: :feed_item

  get 'feed_item/clean'

  get 'improve_sanitization/show'

  get 'read_mode/index'
  get 'read_mode/get'
  get 'read_mode/stats'
  post 'read_mode/mark_item_as_read'

  get 'cache_all_feeds' => 'subscriptions#cache_all_feeds', as: :cache_all_feeds
  get 'enqueue_cache_all_feeds' => 'subscriptions#enqueue_cache_all_feeds', as: :enqueue_cache_all_feeds
  delete 'destroy_all_subscriptios' => 'subscriptions#destroy_all_subscriptions', as: :destroy_all_subscriptions
  delete 'destroy_all_articles' => 'subscriptions#destroy_all_feed_items', as: :destroy_all_articles
  delete 'mark_all_read' => 'subscriptions#mark_all_read', as: :mark_all_read

  resources :subscriptions do
    member do
      get 'cache_feed'
    end
  end

  get 'opml_import/index'
  post 'opml_import/import'

  devise_for :users

  root 'read_mode#index'

  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'
end
