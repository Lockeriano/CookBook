FactoryBot.define do
  factory :user do
    name "test_user"
    email "test@test.com"
    password "password"
    admin true
  end
end
