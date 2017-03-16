require "rails_helper"

RSpec.describe SubscriptionNotificationsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/subscription_notifications").to route_to("subscription_notifications#index")
    end

    it "routes to #new" do
      expect(:get => "/subscription_notifications/new").to route_to("subscription_notifications#new")
    end

    it "routes to #show" do
      expect(:get => "/subscription_notifications/1").to route_to("subscription_notifications#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/subscription_notifications/1/edit").to route_to("subscription_notifications#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/subscription_notifications").to route_to("subscription_notifications#create")
    end

    it "routes to #update" do
      expect(:put => "/subscription_notifications/1").to route_to("subscription_notifications#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/subscription_notifications/1").to route_to("subscription_notifications#destroy", :id => "1")
    end

  end
end
