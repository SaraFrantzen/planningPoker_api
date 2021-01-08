RSpec.describe 'GET /api/polls', type: :request do
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }
  let!(:polls) do
    3.times do
      create(:poll, category: 'api', user_id: user.id)
    end
    2.times do
      create(:poll, category: 'client', user_id: user.id)
    end
  end

  describe 'successfully index' do
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

  describe 'successfully category api index' do
    before do
      get '/api/polls',
          params: { category: 'api' }
    end

    it 'responds with ok status' do
      expect(response).to have_http_status :ok
    end

    it 'returns api category' do
      expect(response_json['polls'][0]['category']).to eq 'api'
    end

    it 'returns 3 polls' do
      expect(response_json['polls'].count).to eq 3
    end
  end

  describe 'successfully category client index' do
    before do
      get '/api/polls',
          params: { category: 'client' }
    end

    it 'responds with ok status' do
      expect(response).to have_http_status :ok
    end

    it 'returns client category' do
      expect(response_json['polls'][0]['category']).to eq 'client'
    end

    it 'returns 3 polls' do
      expect(response_json['polls'].count).to eq 2
    end
  end

  describe 'Unsuccessfully - unvalid category' do
    before do
      get '/api/polls',
          params: { category: 'backend' }
    end

    it 'returns error message' do
      expect(response_json['error']).to eq "Sorry, we don't have that category"
    end

    it 'responds with not found status' do
      expect(response).to have_http_status :not_found
    end
  end
end
