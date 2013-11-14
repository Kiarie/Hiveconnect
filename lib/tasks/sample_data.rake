namespace :db do
desc "populate database"
task populate: :environment do
		99.times do |n|
			name = "kiamtu#{n+1}"
			email = "example#{n+1}@yahoo.com"
			password = "passpass"
			passcon = "passpass"

		Hive.create!(name: name,
				email: email,
				password: password,
				password_confirmation: passcon
				)
		end
	end
end