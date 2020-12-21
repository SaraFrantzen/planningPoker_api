RSpec.describe 'GET /api/polls', type: :request do
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }
  let!(:polls) do
    5.times do
      create(:poll, user_id: user.id)
    end
  end

  describe 'successfully' do
    before do
      get '/api/polls'
    end

    it 'responds with ok status' do
      expect(response).to have_http_status :ok
    end

    it 'returns a specific poll title' do
      expect(response_json['polls'].first['title']).to eq 'MyTitle'
    end

    it 'returns a specific poll description' do
      expect(response_json['polls'].second['description']).to eq 'MyDescription'
    end

    it 'returns 5 polls' do
      expect(response_json['polls'].count).to eq 5
    end

    it 'does not return a specific poll tasks' do
      expect(response_json['polls'].second['tasks']).to eq nil
    end
  end
end
