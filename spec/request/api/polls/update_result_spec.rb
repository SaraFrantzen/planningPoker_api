RSpec.describe 'PUT /api/polls', type: :request do
  let(:poll) { create(:poll) }
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }

  describe 'user successfully close poll by assigning a result value' do
    before do
      put "/api/polls/#{poll.id}",
          params: {
            poll: {
              result: 2
            }
          }, headers: headers
    end

    it 'responds with ok status' do
      expect(response).to have_http_status :ok
    end

    it 'returns success message' do
      expect(response_json['message']).to eq 'result successfully assigned'
    end

    it 'returns polls result' do
      poll = Poll.last
      expect(poll.result).to eq 2
    end

    it 'returns updated poll state' do
      poll = Poll.last
      expect(poll.state).to eq 'closed'
    end
  end

  describe 'unsuccessfully close - result value is already assigned' do
    before do
      put "/api/polls/#{poll.id}",
          params: {
            poll: {
              result: 2
            }
          }, headers: headers
    end
    before do
      put "/api/polls/#{poll.id}",
          params: {
            poll: {
              result: 2
            }
          }, headers: headers
    end
    it 'responds with unprocessable_entity' do
      expect(response).to have_http_status :unprocessable_entity
    end

    it 'returns error message' do
      expect(response_json['message']).to eq 'result is already assigned'
    end
  end
end
