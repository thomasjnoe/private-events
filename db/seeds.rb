# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do |n|
	name = Faker::Name.name
	email = "user-#{n+1}@example.com"
	User.create!(name: name, email: email)
end

users = User.order(:created_at).take(6)
25.times do 
	title = "#{Faker::Name.last_name}'s Party"
	description = Faker::Lorem.sentence
	location = "#{Faker::Address.city}, #{Faker::Address.state}"
	date = Faker::Date.between(1.year.ago, 1.year.from_now).strftime('%A, %B %d, %Y')
	creator_id = users.sample.id
	attendees = users.sample(rand(1..20))
	event = Event.create!(title: title, description: description, location: location, date: date, creator_id: creator_id)
	event.attendees.concat(attendees)
end

