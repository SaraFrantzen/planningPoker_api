RSpec.describe 'PUT /api/polls', type: :request do
  let(:poll) { create(:poll) }
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }
  let!(:user1) { create(:user, email: 're-vote_user@mail.com') }

  describe 'user successfully join a poll' do
    before do
      put "/api/polls/#{poll.id}",
          params: {
            poll: {
              team: [user.uid]
            }
          }, headers: headers
    end

    it 'responds with ok status' do
      expect(response).to have_http_status :ok
    end

    it 'returns success message' do
      expect(response_json['message']).to eq 'successfully joined'
    end

    it 'updates an poll with team' do
      poll = Poll.last
      expect(poll.team).to eq ['teamMember1@epidemic.com', 'teamMember2@epidemic.com', user.name]
    end
  end

  describe 'unsuccessfully join - user already joined a poll' do
    before do
      put "/api/polls/#{poll.id}",
          params: {
            poll: { team: user.uid.to_s }
          }, headers: headers
    end
    before do
      put "/api/polls/#{poll.id}",
          params: {
            poll: { team: user.uid.to_s }
          }, headers: headers
    end
    it 'responds with unprocessable_entity' do
      expect(response).to have_http_status :unprocessable_entity
    end

    it 'returns error message' do
      expect(response_json['message']).to eq 'You already joined this poll'
    end
  end

  describe 'user successfully vote on a poll' do
    before do
      put "/api/polls/#{poll.id}",
          params: {
            poll: {
              points: 3,
              votes: { "#{user.uid}": poll.points.to_s }
            }
          }, headers: headers
    end

    it 'responds with ok status' do
      expect(response).to have_http_status :ok
    end

    it 'returns success message' do
      expect(response_json['message']).to eq 'successfully voted'
    end

    it 'updates an poll with points' do
      poll = Poll.last
      expect(poll.points).to eq [2, 3]
    end

    it 'updates an poll with votes' do
      poll = Poll.last
      expect(poll.votes).to eq :"votingUser2@mail.com" => 2, :"votingUser1@mail.com" => 0, user.uid.to_s => '3'
    end
  end

  describe 'unsuccessfully vote - not authorized' do
    before do
      put "/api/polls/#{poll.id}",
          params: {
            poll: {
              points: 3,
              votes: { "#{user.uid}": poll.points.to_s }
            }
          }
    end

    it 'responds with unauthorized status' do
      expect(response).to have_http_status :unauthorized
    end
  end

  describe 'unsuccessfully vote - points are missing' do
    before do
      put "/api/polls/#{poll.id}",
          params: {
            poll: {
              points: nil,
              votes: { "#{user.uid}": poll.points.to_s}
            }
          }, headers: headers
    end

    it 'responds with unauthorized status' do
      expect(response).to have_http_status :unprocessable_entity
    end
  end

  describe 'user successfully un-vote on a poll' do
    before do
      put "/api/polls/#{poll.id}",
          params: {
            poll: {
              points: 3,
              votes: { "#{user.uid}": poll.points.to_s}
            }
          }, headers: headers
    end
    before do
      put "/api/polls/#{poll.id}",
          params: {
            poll: {
              points: 3,
              votes: { "#{user.uid}": poll.points.to_s}
            }
          }, headers: headers
    end

    it 'responds with ok status' do
      expect(response).to have_http_status :ok
    end

    it 'returns success message' do
      expect(response_json['message']).to eq 'successfully un-voted'
    end

    it 'updates an poll with votes' do
      poll = Poll.last
      expect(poll.votes).to eq "votingUser1@mail.com": 0, "votingUser2@mail.com": 2
    end
  end
end
