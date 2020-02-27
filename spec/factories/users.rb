FactoryBot.define do
  factory :user do
  	id { 'id' }
    name { Faker::Lorem.characters(number: 5) }
    friendly_url { Faker::Lorem.characters(number: 5) }
    email { Faker::Internet.email }
    introduction { Faker::Lorem.characters(number: 20) }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
