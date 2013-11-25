namespace :db do
desc "populate database"
task populate: :environment do
	users = Hive.all
	user = users.first
	followed_users = users[1..20]
	followers = users[20..45]
	followed_users.each{ |followed| users.follow!(followed) }
	followers.each{ |follower| follower.follow!(user) }
	end
end