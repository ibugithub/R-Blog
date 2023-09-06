FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph }
    author { association(:user) }
  end
end
