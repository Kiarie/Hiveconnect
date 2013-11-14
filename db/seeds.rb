# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#admin = Hive.create(name: 'mburu kiarie', email: 'kiambu@yahoo.com', password: 'poopoo', password_confirmation: 'poopoo')
#admin.toggle!(:admin)
users = Hive.all(limit:6)
	50.times do
	content = "sample content".to_a.shuffle.to_s
	users.each {|f| f.microposts.create!(content: content)}
	end