# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


sub1 = Subscription.create name: 'heise', feed_url: 'http://www.heise.de/newsticker/heise-atom.xml', http_url: 'http://heise.de'
sub2 = Subscription.create name: 'fefe', feed_url: 'http://blog.fefe.de/rss.xml?html', http_url: 'http://blog.fefe.de'

1.upto(20) do |i|
 FeedItem.create subscription: sub1, title: "breaking news: no #{i}", url: 'http://www.heise.de', content: "This is the content no #{i}", read: false, published_at: Time.now
end

