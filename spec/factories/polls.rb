FactoryBot.define do
  factory :poll do
    title { 'MyTitle' }
    description { 'MyDescription' }
    tasks { 'MyTasks' }
    points { [2] }
    team { ['teamMember1@epidemic.com', 'teamMember2@epidemic.com'] }
    votes {{ "votingUser1@mail.com": 0, "votingUser2@mail.com": 2 }}
    state { 'ongoing'}
    association :user, factory: :user
  end
end
