require "rails_helper"

RSpec.describe FamilyMember, type: :model do
  context "validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :birthdate }
    it { should validate_presence_of :relationship_id }

    it { should validate_uniqueness_of(:first_name).scoped_to(:last_name).case_insensitive }
  end

  context "#formatted_relationship" do
    before do
      rel = Relationship.create(rel_type: "me")
      @fam = FamilyMember.create(first_name: "Mark",
                                 last_name: "Miranda",
                                 birthdate: "1981-12-06",
                                 relationship_id: rel.id)
    end

    it "returns a formatted relationship type" do
      expect(@fam.formatted_relationship).to eq("ME")
    end
  end
end
