require 'rails_helper'

RSpec.describe "SubscriptionNotifications", :type => :request do
  describe "GET /subscription_notifications" do
    it "works! (now write some real specs)" do
      get subscription_notifications_path
      expect(response.status).to be(200)
    end
  end
end
