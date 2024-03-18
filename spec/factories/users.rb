#spec/factories/users.rb

FactoryBot.define do
  factory :user do
    email { "user@example.com" }
    password { "password" }
    password_confirmation { "password" }
    first_name { "John" } # Add this line
    last_name { "Doe" }   # And this line
  end
end
