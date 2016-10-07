  require "rails_helper"

  RSpec.describe Relationship, type: :model do
    context "relationships" do
      it { should have_many :family_members }
    end

    context "#from_family_member" do
      before do
        Relationship.create(rel_type: "wife")
      end

      it "should create a new relationship" do
        expect { Relationship.from_family_member("brother") }.to change{ Relationship.count }.by(1)
      end

      it "should not create a new relationship, but find the old one" do
        expect { Relationship.from_family_member("wife") }.not_to change { Relationship.count }
      end
    end

  end
