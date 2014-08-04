require 'rails_helper'

RSpec.describe "subscriptions/show", :type => :view do
  before(:each) do
    @subscription = assign(:subscription, Subscription.create!(
      :name => "Name",
      :feed_url => "Feed Url",
      :http_url => "Http Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Feed Url/)
    expect(rendered).to match(/Http Url/)
  end
end
