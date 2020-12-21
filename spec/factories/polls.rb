FactoryBot.define do
  factory :poll do
    title { "MyTitle" }
    description { "MyDescription" }
    tasks { "MyTasks" }
    points { [2] }
    association :user, factory: :user
  end
end
