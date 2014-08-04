require 'rails_helper'

RSpec.describe "subscriptions/edit", :type => :view do
  before(:each) do
    @subscription = assign(:subscription, Subscription.create!(
      :name => "MyString",
      :feed_url => "MyString",
      :http_url => "MyString"
    ))
  end

  it "renders the edit subscription form" do
    render

    assert_select "form[action=?][method=?]", subscription_path(@subscription), "post" do

      assert_select "input#subscription_name[name=?]", "subscription[name]"

      assert_select "input#subscription_feed_url[name=?]", "subscription[feed_url]"

      assert_select "input#subscription_http_url[name=?]", "subscription[http_url]"
    end
  end
end
