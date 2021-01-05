FactoryBot.define do
  factory :comment do
    user_name { 'UserName' }
    comment { 'MyText' }
    association :poll, factory: :poll
  end
end
