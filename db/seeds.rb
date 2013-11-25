# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = Hive.create(name: 'mburu kiarie', email: 'kiambu@yahoo.com', password: 'poopoo', password_confirmation: 'poopoo')
admin.toggle!(:admin)
46.times do |n|
	name = "example_user#{n+1}"
	email = "user#{n+1}@hiveconnect.com"
	password = "police"
	pass2 = "police"
Hive.create!(name: name,
			email: email,
			password: password,
			password_confirmation: pass2)
end
users = Hive.all(limit:6)
	50.times do |n|
	content = "sample content#{n+1}"
	users.each{|f| f.microposts.create!(content: content)}
	end

users = Hive.all
user = users.first
followed_users = users[1..20]
followers = users[20..45]
followed_users.each{ |followed| user.follow!(followed) }
followers.each{ |follower| follower.follow!(user) }