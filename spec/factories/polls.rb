FactoryBot.define do
  factory :poll do
    title { "MyTitle" }
    description { "MyDescription" }
    tasks { "MyTasks" }
    points { [2] }
    team { ["teamMember1@epidemic.com", "teamMember2@epidemic.com"]}
    association :user, factory: :user
  end
end
