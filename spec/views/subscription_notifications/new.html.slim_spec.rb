require 'rails_helper'

RSpec.describe "subscription_notifications/new", :type => :view do
  before(:each) do
    assign(:subscription_notification, SubscriptionNotification.new())
  end

  it "renders new subscription_notification form" do
    render

    assert_select "form[action=?][method=?]", subscription_notifications_path, "post" do
    end
  end
end
