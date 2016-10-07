require "rails_helper"

RSpec.describe FamilyMembersController do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "assigns @family_members" do
      rel = Relationship.create(rel_type: "me")
      fam = FamilyMember.create(first_name: "Mark",
                                last_name: "Miranda",
                                birthdate: "1981-12-06",
                                relationship_id: rel.id)
      get :index
      expect(assigns(:family_members)).to eq([fam])
    end
  end

  describe "GET new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
    before do
      @valid_attr = {first_name: "Mark",
                     last_name: "Miranda",
                     birthdate: "1981-12-06",
                     relationship_id: "me" }
      @invalid_attr = {first_name: "Mark",
                       birthdate: "1981-12-06",
                       relationship_id: "me"}
    end

    it "saves a new family member to the database" do
      expect {
        post :create, params: { family_member: @valid_attr }
      }.to change(FamilyMember, :count).by(1)
    end

    it "redirects to the family_members index page" do
      post :create, params: { family_member: @valid_attr }
      expect(response).to redirect_to(family_members_path)
    end

    it "doesn't save if attributes are missing" do
      expect {
        post :create, params: { family_member: @invalid_attr }
      }.to_not change(FamilyMember, :count)
    end

    it "renders new template on error" do
      post :create, params: { family_member: @invalid_attr }
      expect(response).to render_template(:new)
    end
  end
end
