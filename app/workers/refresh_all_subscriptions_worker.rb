class RefreshAllSubscriptionsWorker
  include Sidekiq::Worker

  def perform(*args)
    Subscription.all.each do |subscription|
      RefreshSubscriptionWorker.perform_async(subscription.id)
    end
  end
end


Sidekiq::Cron::Job.create(name: 'Refresh all worker', cron: '*/30 * * * *', class: 'RefreshAllSubscriptionsWorker')
