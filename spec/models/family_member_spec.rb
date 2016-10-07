require "rails_helper"

RSpec.describe FamilyMember, type: :model do
  context "validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :birthdate }
    it { should validate_presence_of :relationship_id }

    it { should validate_uniqueness_of(:first_name).scoped_to(:last_name) }
  end
end
