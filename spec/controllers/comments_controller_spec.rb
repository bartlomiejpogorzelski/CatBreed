require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:parent_post) { create(:post) }
  let(:comment) { create(:comment, post: parent_post, user: user) }
  let(:valid_attributes) { { body: 'Test comment body' } }
  let(:invalid_attributes) { { body: nil } }

  before do
    sign_in user
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new comment' do
        expect {
          post :create, params: { post_id: parent_post.id, comment: valid_attributes }, format: :turbo_stream
        }.to change(parent_post.comments, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new comment' do
        expect {
          post :create, params: { post_id: parent_post.id, comment: invalid_attributes }
        }.not_to change(parent_post.comments, :count)
      end
    end
  end

  describe 'PATCH/PUT #update' do
    context 'with valid attributes' do
      it 'updates the comment' do
        patch :update, params: { post_id: parent_post.id, id: comment.id, comment: { body: 'Updated comment body' } }, format: :turbo_stream
        comment.reload
        expect(comment.body.to_plain_text).to eq('Updated comment body')
      end
    end

    # context 'with invalid attributes' do
    #   it 'does not update the comment' do
    #     original_body = comment.body.to_plain_text
    #     patch :update, params: { post_id: parent_post.id, id: comment.id, comment: { body: nil } }
    #     comment.reload
    #     expect(comment.body.to_plain_text).to eq(original_body)
    #   end
    # end
  end
  describe 'DELETE #destroy' do
    it 'deletes the comment' do
      comment
      expect {
        delete :destroy, params: { post_id: parent_post.id, id: comment.id }, format: :turbo_stream
      }.to change(parent_post.comments, :count).by(-1)
    end
  end
end
