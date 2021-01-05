FactoryBot.define do
  factory :comment do
    user_name { 'UserName' }
    comment { 'MyComment' }
    association :poll, factory: :poll
  end
end
