FactoryBot.define do
  factory :owner do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end