RSpec.describe 'PUT /api/polls', type: :request do
  let(:poll) { create(:poll) }
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }

  describe 'user successfully apply to join a poll' do
    before do
      put "/api/polls/#{poll.id}",
          params: {
            poll: { team: user.id.to_s }
          }, headers: headers
    end

    it 'responds with ok status' do
      expect(response).to have_http_status :ok
    end

    it 'returns success message' do
      expect(response_json['message']).to eq 'successfully joined this poll'
    end

    it 'updates an poll with team' do
      poll = Poll.last
      expect(poll.team).to eq [1, 2, user.id]
    end
	end
end