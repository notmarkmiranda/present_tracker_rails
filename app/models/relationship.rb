class Relationship < ApplicationRecord
  has_many :family_members

  def self.from_family_member(input)
    rel = find_or_initialize_by(rel_type: input[:relationship_id].downcase)
    if rel.save
      cleaned = clean_input(input)
      fam = FamilyMember.new(cleaned)
      fam.relationship_id = rel.id
      fam
    end
  end

  def self.clean_input(inputs)
    inputs.map { |k, v| [k, v.strip.downcase] }.to_h
  end
end
