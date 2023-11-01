require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /login" do
    it "returns the login page" do
      get login_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /login" do
    # Directly create a user in the test database
    let!(:user) do
      User.create!(uni: 'abc1', password: 'abc123', password_confirmation: 'abc123')
      # Add other necessary fields and values required by your User model
    end

    context "with valid credentials" do
      it "logs the user in and redirects to the welcome index" do
        post login_path, params: { session: { uni: user.uni, password: 'abc123' } }
        expect(response).to redirect_to(welcome_index_path)
        follow_redirect!
        expect(response.body).to include("UNI: #{user.uni}")
      end
    end

    context "with invalid credentials" do
      it "renders the login page with an error" do
        post login_path, params: { session: { uni: user.uni, password: 'incorrect' } }
        expect(response).to render_template(:new)
        expect(flash[:danger]).to be_present
      end
    end
  end
end

