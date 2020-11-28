FactoryBot.define do
  factory :post do
    content  { Faker::Lorem.characters(number: 1..140) }
    association :user
  end
end
