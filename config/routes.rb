Rails.application.routes.draw do
  get 'feed_item/show/:id' => 'feed_item#show', as: :feed_item

  get 'feed_item/clean'

  get 'improve_sanitization/show'

  get 'read_mode/index'
  get 'read_mode/get'
  get 'read_mode/stats'
  post 'read_mode/mark_item_as_read'

  get 'cache_all_feeds' => 'subscriptions#cache_all_feeds', as: :cache_all_feeds

  resources :subscriptions do
    member do
      get 'cache_feed'
    end
  end

  get 'opml_import/index'
  post 'opml_import/import'

  devise_for :users

  root 'read_mode#index'
end
