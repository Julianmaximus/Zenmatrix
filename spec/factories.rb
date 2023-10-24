# spec/factories.rb

require 'faker'

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.unique.email }
    password { "password" }
  end

  factory :post do
    title { Faker::Lorem.sentence(word_count: 3) }
    body { Faker::Lorem.paragraph(sentence_count: 2) }
    user
  end
end
