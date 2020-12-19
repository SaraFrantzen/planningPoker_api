RSpec.describe 'GET /api/polls', type: :request do
  let!(:polls) do
    5.times do
      create(:poll)
    end
  end

  describe 'successfully' do
    before do
      get '/api/polls'
    end

    it 'is expected to respond with ok status' do
      expect(response).to have_http_status :ok
    end

    it 'is expected to return a specific poll title' do
      expect(response_json['polls'].first['title']).to eq 'MyString'
    end

    it 'is expected to return a specific poll description' do
      expect(response_json['polls'].second['description']).to eq ['myDescription']
    end

    it 'is expected to return 5 polls' do
      expect(response_json['polls'].count).to eq 5
    end
  end
end
