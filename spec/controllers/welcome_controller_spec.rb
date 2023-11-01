require 'rails_helper'

RSpec.describe "Welcome", type: :request do
  describe "GET /welcome/index" do
    context "when not logged in" do
      it "redirects to the login page" do
        get welcome_index_path
        expect(response).to redirect_to(login_path)
      end
    end

    context "when logged in" do
      let(:user) { FactoryBot.create(:user) }

      before do
        sign_in user
      end

      it "renders the index page" do
        get welcome_index_path
        expect(response).to have_http_status(:ok)
        expect(response.body).to include("Welcome to CUDiningPair")
      end
    end
  end
end

