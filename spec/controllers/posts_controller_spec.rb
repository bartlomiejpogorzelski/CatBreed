# require 'rails_helper'

# RSpec.describe PostsController, type: :controller do
#   let(:valid_attributes) { { title: 'Test Title', content: 'Test Content' } }
#   let(:invalid_attributes) { { title: '', content: '' } }
#   let(:user) { create(:user) }

#   before do
#     sign_in user
#   end

#   describe 'POST #create' do
#     context 'when user is authorized' do
#       before do
#         ability = Object.new
#         ability.extend(CanCan::Ability)
#         allow(controller).to receive(:current_ability).and_return(ability)
#         ability.can :create, Post
#       end

#       context 'with valid params' do
#         it 'creates a new Post' do
#           expect {
#             post :create, params: { post: valid_attributes }
#           }.to change(Post, :count).by(1)
#         end    
#       end

#       context 'with invalid params' do
#         it 'does not create a new Post' do
#           expect {
#             post :create, params: { post: invalid_attributes }
#           }.to_not change(Post, :count)
#         end      
#       end
#   end
# end
#     context 'when user is not authorized' do
#       before do
#         # Ustaw uprawnienia tak, aby użytkownik nie mógł tworzyć postów
#         ability = Object.new
#         ability.extend(CanCan::Ability)
#         allow(controller).to receive(:current_ability).and_return(ability)
#         ability.cannot :create, Post
#       end

#       it 'raises AccessDenied error' do
#         expect {
#           post :create, params: { post: valid_attributes }
#         }.to raise_error(CanCan::AccessDenied)
#       end
#     end
  
# end
