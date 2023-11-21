require "rails_helper"

RSpec.describe Cats::KittensController, type: :controller do
  
  describe 'GET #index' do

  it 'assigns cats' do
    cats = create_list(:cat, 3, is_parent: false)

    get :index

    expect(assigns(:cats)).to eq(cats)
  end
end
end


