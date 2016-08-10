# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.create!(name: "Samuel", color: "Black", sex: "M", birth_date: "1989/10/26", description: "stuff")
Cat.create!(name: "Samantha", color: "Black", sex: "F", birth_date: "1991/01/10", description: "more stuff")

#Cat #1 has overlapping requests
CatRentalRequest.create!(cat_id: 1, start_date: "2015/01/02", end_date: "2015/01/30", status: "APPROVED")

#Cat #2 does NOT have overlapping requests
CatRentalRequest.create!(cat_id: 2, start_date: "2015/01/02", end_date: "2015/01/30", status: "APPROVED")
CatRentalRequest.create!(cat_id: 2, start_date: "2015/02/02", end_date: "2015/02/25", status: "APPROVED")
