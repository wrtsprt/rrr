require 'rails_helper'

RSpec.describe "Subscriptions", :type => :request do
  describe "GET /subscriptions" do
    it "works! (now write some real specs)" do
      get subscriptions_path
      expect(response.status).to be(200)
    end
  end
end
