require 'rails_helper'

RSpec.describe FeedItemController, :type => :controller do

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      expect(response).to be_success
    end
  end

  describe "GET 'clean'" do
    it "returns http success" do
      get 'clean'
      expect(response).to be_success
    end
  end

end
