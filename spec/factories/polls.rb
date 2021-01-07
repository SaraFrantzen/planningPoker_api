FactoryBot.define do
  factory :poll do
    title { 'MyTitle' }
    description { 'MyDescription' }
    tasks { 'MyTasks' }
    points { [2] }
    team { ['teamMember1', 'teamMember2'] }
    votes {{ "votingUser1": 0, "votingUser2": 2 }}
  
    association :user, factory: :user
  end
end
