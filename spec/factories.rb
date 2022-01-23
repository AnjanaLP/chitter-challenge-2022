FactoryBot.define do
  factory :user do
    name { "Test User" }
    email  { "test@example.com" }
    username { "test-user" }
    password { "password123" }
    password_confirmation { password_digest }
  end
end
