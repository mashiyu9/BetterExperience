FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    confirmed_at  { Time.zone.now }
    password {"testtest"}
  end
  factory :user2, class: User do
    sequence(:name) { |n| "TEST_USER2#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    confirmed_at  { Time.zone.now }
    password {"tesfefa"}
  end
end
