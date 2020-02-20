FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    password {"testtest"}
  end
  factory :user2, class: User do
    sequence(:name) { |n| "TEST_USER2#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    password {"tesfefa"}
  end
end
