FactoryBot.define do
  factory :user do
    email { "user#{rand(0..999)}@epidemic.com"  }
    password { 'password' }
    password_confirmation { 'password' }
    name { "user#{rand(0..999)}" }
  end
end
