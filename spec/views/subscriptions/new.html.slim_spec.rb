require 'rails_helper'

RSpec.describe "subscriptions/new", :type => :view do
  before(:each) do
    assign(:subscription, Subscription.new(
      :name => "MyString",
      :feed_url => "MyString",
      :http_url => "MyString"
    ))
  end

  it "renders new subscription form" do
    render

    assert_select "form[action=?][method=?]", subscriptions_path, "post" do

      assert_select "input#subscription_name[name=?]", "subscription[name]"

      assert_select "input#subscription_feed_url[name=?]", "subscription[feed_url]"

      assert_select "input#subscription_http_url[name=?]", "subscription[http_url]"
    end
  end
end
