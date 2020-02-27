FactoryBot.define do
  factory :post do
    murmur { Faker::Lorem.characters(number: 10) }
    user
  end
end
