require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get login_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    before do
      # Assuming you have a factory for user. Adjust this as per your actual factory setup.
      # This requires FactoryBot and should match your user model's validations.
      FactoryBot.create(:user, email: "user@example.com", password: "password", password_confirmation: "password")
    end

    it "logs the user in and redirects to the root path" do
      post login_path, params: { session: { email: "user@example.com", password: "password" } }
      expect(response).to redirect_to(root_path)
    end
  end

  describe "DELETE /destroy" do
    it "logs the user out and redirects to the login path" do
      delete logout_path
      expect(response).to redirect_to(login_path)
    end
  end
end
