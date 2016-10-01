require "rails_helper"

RSpec.describe User, type: :model do
  context "should validate presence of and uniqueness of email" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end
  context "should validate presence of password digest" do
    it { should validate_presence_of(:password_digest) }
  end
end
