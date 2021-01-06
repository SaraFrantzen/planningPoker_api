RSpec.describe 'GET /api/comments', type: :request do
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }
  let(:poll) { create(:poll) }
  let!(:comment) do
    5.times do
      create(:comment, poll_id: poll.id)
    end
  end

  describe 'visitor can see comments belonging to specific poll' do
    before do
      get "/api/comments/#{poll.id}"
    end

    it 'responds with ok status' do
      expect(response).to have_http_status :ok
    end

    it 'returns a specific comment' do
      expect(response_json['comments'].first['comment']).to eq 'MyComment'
    end

    it 'returns a specific user name' do
      expect(response_json['comments'].first['user_name']).to eq 'UserName'
    end
    it 'returns 5 comments' do
      expect(response_json['comments'].count).to eq 5
    end
  end


end
