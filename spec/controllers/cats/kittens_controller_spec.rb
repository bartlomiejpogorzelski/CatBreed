# frozen_string_literal: true

require "rails_helper"

RSpec.describe Cats::KittensController, type: :controller do
  
  let(:cat_1) { Cat.create(is_parent: false, name: "name1", breed: "abyssinian") }
  let(:cat_2) { Cat.create(is_parent: false, name: "name2", breed: "persian") }

  describe 'GET #index' do

  it 'assigns cats' do
    cats = [cat_1,cat_2]

    get :index
    expect(assigns(:cats)).to eq(cats)
  end
end
end


