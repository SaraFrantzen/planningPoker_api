RSpec.describe 'PUT /api/polls', type: :request do
  let(:poll) { create(:poll) }
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }

  describe 'user successfully close voting by changing poll state from ongoing to pending' do
    before do
      put "/api/polls/#{poll.id}",
          params: {
            poll: {
              state: 'pending'
            }
          }, headers: headers
    end

    it 'responds with ok status' do
      expect(response).to have_http_status :ok
    end

    it 'returns success message' do
      expect(response_json['message']).to eq 'Voting succesfully closed'
    end

    it 'returns updated poll state' do
      poll = Poll.last
      expect(poll.state).to eq 'pending'
    end
  end

  describe 'unsuccessfully close voting - not authorized' do
    before do
      put "/api/polls/#{poll.id}",
          params: {
            poll: {
              state: 'pending'
            }
          }
    end

    it 'responds with unauthorized status' do
      expect(response).to have_http_status :unauthorized
    end
  end
end
