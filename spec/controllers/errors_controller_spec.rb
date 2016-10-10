require "rails_helper"

RSpec.describe ErrorsController do
  describe "GET show" do
    it "renders the show template" do
      get :show
      expect(response).to render_template("show")
    end
  end
end
