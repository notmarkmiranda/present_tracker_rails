  require "rails_helper"

  RSpec.describe Relationship, type: :model do
    context "relationships" do
      it { should have_many :family_members }
    end

    context "#from_family_member" do
      before do
        rel = Relationship.create(rel_type: "wife")
        @fam = FamilyMember.create(first_name: "first",
                                   last_name: "last",
                                   birthdate: "1981-12-06",
                                   relationship_id: rel.id)
      end

      it "should create a new relationship" do
        expect { Relationship.from_family_member({raw_relationship: "brother"}, "create", @fam) }.to change{ Relationship.count }.by(1)
      end

      it "should not create a new relationship, but find the old one" do
        expect { Relationship.from_family_member({ raw_relationship: "wife" }, "create", @fam) }.not_to change { Relationship.count }
      end
    end

  end
