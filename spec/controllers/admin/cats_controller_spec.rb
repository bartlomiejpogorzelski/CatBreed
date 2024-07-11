require "rails_helper"

RSpec.describe Admin::CatsController, type: :controller do
  let(:user) { create(:user, role: :admin) }
  before do
    sign_in user
  end

  let(:params) {
    {
      cat: {
        name: "Example Cat",
        breed: "Example Breed",
        status: "available"
      }
    }
  }

  describe "#actions for admin role" do
    it "#create a cat" do
      expect {
        post :create, params: params
      }.to change(Cat, :count).by(1)

      expect(response).to redirect_to(admin_cats_path)
    end

    it "#new" do
      get :new

      expect(response).to have_http_status(:ok)
    end

    it "#index" do
      get :index

      expect(response).to have_http_status(:ok)
    end
  end

  describe "#actions for user role" do
    let(:user) { create(:user, role: :user) }
    
    it "#create: try access to create cat" do
      expect {
        post :create, params: params
      }.to change(Cat, :count).by(0)

      expect(response).to redirect_to(unauthorized_path)
    end

    it "#new: try access to new" do      
      get :new

      expect(response).to redirect_to(unauthorized_path)
    end

    it "#index: try access to index" do      
      get :index

      expect(response).to redirect_to(unauthorized_path)
      expect(response).to have_http_status(302)
    end
  end
end

