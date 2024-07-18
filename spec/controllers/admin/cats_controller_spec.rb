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
        breed: Cat::BREEDS.sample,
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

  let(:cat) { create(:cat, status: "reserved") }

  describe "#update" do
    context "with valid params" do
      let(:valid_params) {
        {
          id: cat.id,
          status: "sold",
          format: :turbo_stream
        }
      }

      it "updates the cat status" do
        patch :update, params: valid_params

        cat.reload
        expect(cat.status).to eq("sold")
      end

      it "renders turbo_stream response on success" do
        patch :update, params: valid_params

        expect(response).to have_http_status(:success)
        expect(response.body).to include("turbo-stream")
        expect(response.body).to include("cat_#{cat.id}")
      end
    end
  end
end

