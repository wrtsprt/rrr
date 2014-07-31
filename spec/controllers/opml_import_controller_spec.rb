require 'rails_helper'

RSpec.describe OpmlImportController, :type => :controller do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'import'" do
    it "returns http success" do
      get 'import'
      expect(response).to be_success
    end
  end

end
