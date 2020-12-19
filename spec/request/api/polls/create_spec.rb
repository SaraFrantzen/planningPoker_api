RSpec.describe 'POST /api/polls', type: :request do
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }

  describe 'user successfully create an poll' do
    before do
      post '/api/polls',
           params: {
             poll: {
               title: 'API can provide polls index',
               description: 'As an API.
							In order to provide a list of polls in DB.
							I would like to provide an index endpoint for polls.',
               tasks: 'index action, routes to the action, polls model: title, description, polls Index in serializer',
               points: []
             }
           }, headers: headers
    end

    it 'responds with create status' do
      expect(response).to have_http_status :ok
    end

    it 'returns success message' do
      expect(response_json['message']).to eq 'successfully saved'
    end

    it 'creates an poll' do
      poll = Poll.last
      expect(poll.title).to eq 'API can provide polls index'
    end
  end
end
