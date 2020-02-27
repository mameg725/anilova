FactoryBot.define do
  factory :post_comment do
    sequence(:reaction) { |n| "TEST#{n}" }
  end
end
