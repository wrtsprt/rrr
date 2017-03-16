require 'rails_helper'

RSpec.describe "subscription_notifications/edit", :type => :view do
  before(:each) do
    @subscription_notification = assign(:subscription_notification, SubscriptionNotification.create!())
  end

  it "renders the edit subscription_notification form" do
    render

    assert_select "form[action=?][method=?]", subscription_notification_path(@subscription_notification), "post" do
    end
  end
end
