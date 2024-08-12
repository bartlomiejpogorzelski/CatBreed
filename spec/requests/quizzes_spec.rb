require 'rails_helper'

RSpec.describe "Quizzes", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/quizzes/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/quizzes/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/quizzes/show"
      expect(response).to have_http_status(:success)
    end
  end

end
