# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

sub1 = Subscription.create name: 'heise+content', feed_url: 'https://rss-tools.herokuapp.com/heise_newsfeed.rss', http_url: 'http://heise.de'

1.upto(20) do |i|
 FeedItem.create subscription: sub1, title: "breaking news: no #{i}", url: 'http://www.heise.de', content: "This is the content no #{i}", read: false, published_at: Time.now
end

User.create!(email:'a@bc.de', password:'password')
