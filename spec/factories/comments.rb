FactoryBot.define do
  factory :comment do
    comment { Faker::Lorem.characters(number: 1..140) }
    association :user
    association :post
  end
end
