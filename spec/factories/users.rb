FactoryBot.define do
  factory :user do
    email { 'user@epidemic.com' }
    password { 'password' }
    password_confirmation { 'password' }
    name { 'user' }
  end
end
