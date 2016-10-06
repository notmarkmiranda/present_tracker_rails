require "rails_helper"

RSpec.describe SessionsController do
  describe "GET new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
    before do
      @user = User.create(email: "test@example.com", password: "password")
    end

    it "renders the dashboard template on successful login" do
      post :create, params: { session: { email: @user.email, password: "password" } }
      expect(response).to redirect_to(user_dashboard_path)
    end

    it "renders the new template on unsuccessful login - wrong password" do
      post :create, params: { session: { email: @user.email, password: "pssword" } }
      expect(response).to render_template("new")
    end

    it "renders the new template on unsuccessful login - wrong email" do
      post :create, params: { session: { email: "tst@example.com", password: "password" } }
      expect(response).to render_template("new")
    end
  end

  describe "GET destroy" do
    it "renders the root template" do
      get :destroy
      expect(response).to redirect_to(root_path)
    end
  end
end
