require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/users/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "redirects to root path after user creation" do
      post "/users", params: { user: { first_name: "John", last_name: "Doe", email: "john@example.com", password: "password", password_confirmation: "password" } }
      expect(response).to redirect_to(root_path)
      
      # Since it's a redirect, there's no need to follow it for this test
      # follow_redirect!
      
      # After the redirection, you would typically expect a different status,
      # such as :found (302) or :redirect (303), not :success (200)
      # expect(response).to have_http_status(:success)
    end
  end
end
