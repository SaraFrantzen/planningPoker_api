FactoryBot.define do
  factory :poll do
    title { 'MyTitle' }
    description { 'MyDescription' }
    tasks { 'MyTasks' }
    team { ['teamMember1', 'teamMember2'] }
    votes {{ "votingUser1": 0, "votingUser2": 2 }}
    category { 'api' }
    association :user, factory: :user
  end
end
