RSpec.describe 'PUT /api/polls', type: :request do
  let(:poll) { create(:poll) }
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }

  describe 'user successfully join a poll' do
    before do
      put "/api/polls/#{poll.id}",
          params: {
            poll: {
              team: [user.name]
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
      expect(poll.team).to eq ['teamMember1', 'teamMember2', user.name]
    end
  end

  describe 'unsuccessfully join - user already joined a poll' do
    before do
      put "/api/polls/#{poll.id}",
          params: {
            poll: { team: user.name }
          }, headers: headers
    end
    before do
      put "/api/polls/#{poll.id}",
          params: {
            poll: { team: user.name }
          }, headers: headers
    end
    it 'responds with unprocessable_entity' do
      expect(response).to have_http_status :unprocessable_entity
    end

    it 'returns error message' do
      expect(response_json['message']).to eq 'You already joined this poll'
    end
  end
end
