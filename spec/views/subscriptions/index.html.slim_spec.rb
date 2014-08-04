require 'rails_helper'

RSpec.describe "subscriptions/index", :type => :view do
  before(:each) do
    assign(:subscriptions, [
      Subscription.create!(
        :name => "Name",
        :feed_url => "Feed Url",
        :http_url => "Http Url"
      ),
      Subscription.create!(
        :name => "Name",
        :feed_url => "Feed Url",
        :http_url => "Http Url"
      )
    ])
  end

  it "renders a list of subscriptions" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Feed Url".to_s, :count => 2
    assert_select "tr>td", :text => "Http Url".to_s, :count => 2
  end
end
