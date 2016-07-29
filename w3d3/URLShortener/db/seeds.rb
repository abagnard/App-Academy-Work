# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#
User.create!(email: 'abc')
User.create!(email: 'def')

ShortenedUrl.create_for_user_and_long_url!( 1, "googlemaps.com")
ShortenedUrl.create_for_user_and_long_url!( 1, "github.com")
ShortenedUrl.create_for_user_and_long_url!( 2, "ubereats.com")

Visit.create!(visitor_id: 1, url_id: 1)
Visit.create!(visitor_id: 1, url_id: 1)
Visit.create!(visitor_id: 2, url_id: 2)
