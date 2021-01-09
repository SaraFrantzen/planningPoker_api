RSpec.describe 'PUT /api/polls', type: :request do
  let(:poll) { create(:poll) }
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }
  let!(:user1) { create(:user, email: 're-vote_user@mail.com') }

  describe 'user successfully vote on a poll' do
    before do
      user = User.name
      put "/api/polls/#{poll.id}",
          params: {
            poll: {
              votes: { user: 3 }
            }
          }, headers: headers
    end

    it 'responds with ok status' do
      expect(response).to have_http_status :ok
    end

    it 'returns success message' do
      expect(response_json['message']).to eq 'successfully voted'
    end

    it 'updates an poll with votes' do
      poll = Poll.last
      expect(poll.votes).to eq :votingUser2 => 2, :votingUser1 => 0, user.name => '3'
    end
  end

  describe 'unsuccessfully vote - not authorized' do
    before do
      put "/api/polls/#{poll.id}",
          params: {
            poll: {
              votes: { "#{user.name}": 3 }
            }
          }
    end

    it 'responds with unauthorized status' do
      expect(response).to have_http_status :unauthorized
    end
  end

  describe 'user successfully un-vote on a poll' do
    before do
      user = User.name
      put "/api/polls/#{poll.id}",
          params: {
            poll: {
              votes: { user: 3 }
            }
          }, headers: headers
    end
    before do
      put "/api/polls/#{poll.id}",
          params: {
            poll: {
              votes: { user: 3 }
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
      expect(poll.votes).to eq "votingUser1": 0, "votingUser2": 2
    end
  end
end
