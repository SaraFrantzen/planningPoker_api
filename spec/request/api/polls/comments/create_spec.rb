RSpec.describe 'POST /api/polls', type: :request do
    let(:user) { create(:user) }
    let(:credentials) { user.create_new_auth_token }
    let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }
    let(:poll) { create(:poll) }
  
    describe 'user successfully post comment to poll' do
      before do
        post '/api/comments',
             params: {
                 poll_id: poll.id,
                comment: {
                  user_name: user.name,
                 comment: 'myComment',
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
        comment = Comment.last
        expect(comment.comment).to eq 'myComment'
        expect(comment.user_name).to eq user.name
      end
    end
end  