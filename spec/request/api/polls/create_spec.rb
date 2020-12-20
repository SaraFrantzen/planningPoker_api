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
      expect(poll.description).to include 'As an API'
      expect(poll.tasks).to eq 'index action, routes to the action, polls model: title, description, polls Index in serializer'
      expect(poll.points).to eq [nil]
    end
  end

  describe 'without valid params' do
    before do
      post '/api/polls',
           params: {
             poll: {
               title: 'API can provide polls index'
             }
           }, headers: headers
    end

    it 'responds with unprocessable entity status' do
      expect(response).to have_http_status :unprocessable_entity
    end

    it 'returns a unsuccesfully message if params are blank' do
      expect(response_json['message']).to eq "Description can't be blank, Tasks can't be blank, and Points can't be blank"
    end
  end

  describe 'unauthorized without credentials unsuccessfully create an poll' do
    let(:user) { create(:user) }
    let(:credentials) { user.create_new_auth_token }
    let(:headers) { { HTTP_ACCEPT: 'application/json' } }

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
    it 'responds with unauthorized status' do
      expect(response).to have_http_status :unauthorized
    end

    it 'returns error message' do
      expect(response_json['errors'][0]).to eq 'You need to sign in or sign up before continuing.'
    end
  end
end
