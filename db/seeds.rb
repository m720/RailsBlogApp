# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create users
User.find_or_create_by!(username: "user1")
User.find_or_create_by!(username: "user2")
User.find_or_create_by!(username: "user3")

# create 50k stories

stories = 50_000.times.map do |i|
  Story.new(title: "Story #{i}", body: "Body #{i}", user: User.all.sample)
end

Story.import stories

# create 20k reviews

rates = 20_000.times.map do |i|
  Rate.new(rate_value: rand(1..5), user: User.all.sample, story_id: rand(1..50_000))
end

Rate.import rates

