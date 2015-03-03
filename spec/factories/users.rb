FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "danielb#{n}" }
    name "Test User"
    email "test@example.com"
    password "please123"
  end
end
