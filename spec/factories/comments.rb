FactoryBot.define do
  factory :comment do
    text { Faker::Lorem.sentence }
    author { association(:user) }
    post { association(:post) }
  end
end
