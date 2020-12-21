FactoryBot.define do
  factory :poll do
    title { "MyTitle" }
    description { "MyDescription" }
    tasks { "MyTasks" }
    points { [nil] }
    association :user, factory: :user
  end
end
