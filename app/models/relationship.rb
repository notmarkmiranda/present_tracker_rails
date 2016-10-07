class Relationship < ApplicationRecord
  has_many :family_members

  def self.from_family_member(input)
    find_or_create_by(rel_type: input.downcase)
  end
end
