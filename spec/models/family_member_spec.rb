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

  context "#raw_relationship" do
    before do
      rel = Relationship.create(rel_type: "me")
      @fam = FamilyMember.create(first_name: "Mark",
                                 last_name: "Miranda",
                                 birthdate: "1981-12-06",
                                 relationship_id: rel.id)
    end

    it "returns a relationship" do
      expect(@fam.raw_relationship).to eq("me")
    end
  end

  context "#age and #days_until" do
    before do
      rel = Relationship.create(rel_type: "me")
      @fam = FamilyMember.create(first_name: "Mark",
                                 last_name: "Miranda",
                                 birthdate: "1981-12-06",
                                 relationship_id: rel.id)
      allow(Date).to receive(:today).and_return(Date.new(2016, 10, 9))
    end

    it "returns the proper age" do
      expect(@fam.age).to eq(34)
    end

    it "returns the proper days_until" do
      expect(@fam.days_until).to eq(58)
    end
  end

  context "#sorted_by_days_until" do
    before do
      rel = Relationship.create(rel_type: "me")
      @fam1 = FamilyMember.create(first_name: "Holly",
                                  last_name: "Miranda",
                                  birthdate: "1980-07-14",
                                  relationship_id: rel.id)
      @fam2 = FamilyMember.create(first_name: "Mark",
                                  last_name: "Miranda",
                                  birthdate: "1981-12-06",
                                  relationship_id: rel.id)
      allow(Date).to receive(:today).and_return(Date.new(2016, 10, 9))
    end

    it "returns the proper age" do
      expect(FamilyMember.sorted_by_days_until).to eq([@fam2, @fam1])
    end
  end
end
