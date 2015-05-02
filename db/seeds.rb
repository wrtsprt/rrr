# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


sub1 = Subscription.create name: 'heise', feed_url: 'heise.de/atom', http_url: 'heise.de'

1.upto(20) do |i|
 FeedItem.create feed: "Feed", title: "breaking news: no #{i}", url: 'http://www.heise.de', content: "This is the content no #{i}", read: false, published_at: Time.now
end

