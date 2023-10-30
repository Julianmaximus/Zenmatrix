require 'faker'

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
users = User.all
# Create categories
10.times do
  Category.create!(name: Faker::Science.element)
end

# Create users
10.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    gender: Faker::Gender.binary_type,
    admin: Faker::Boolean.boolean
  )
end

# Create posts
User.all.each do |user|
  5.times do
    user.posts.create!(
      title: Faker::Lorem.sentence(word_count: 3),
      body: Faker::Lorem.paragraph(sentence_count: 2),
      category_id: Category.pluck(:id).sample
    )
  end
end
