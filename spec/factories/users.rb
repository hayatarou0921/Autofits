FactoryBot.define do
  factory :user do
    sequence(:id) { |n| n }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { 'password' }
  end
end
