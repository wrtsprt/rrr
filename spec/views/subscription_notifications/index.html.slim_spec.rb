require 'rails_helper'

RSpec.describe "subscription_notifications/index", :type => :view do
  before(:each) do
    assign(:subscription_notifications, [
      SubscriptionNotification.create!(),
      SubscriptionNotification.create!()
    ])
  end

  it "renders a list of subscription_notifications" do
    render
  end
end
