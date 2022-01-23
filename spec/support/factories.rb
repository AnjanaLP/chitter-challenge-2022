FactoryBot.define do
  factory :user do
    name { "Test User" }
    email  { "test@example.com" }
    username { "test-user" }
    password { "password123" }
    password_confirmation { "password123" }
  end

  factory :peep do
    content { "Test peep" }
    user
  end
end
