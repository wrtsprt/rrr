require 'rails_helper'

RSpec.describe "subscription_notifications/show", :type => :view do
  before(:each) do
    @subscription_notification = assign(:subscription_notification, SubscriptionNotification.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
