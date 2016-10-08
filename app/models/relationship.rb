class Relationship < ApplicationRecord
  has_many :family_members

  def self.from_family_member(input, type, member=nil)
    rel = find_or_initialize_by(rel_type: input[:raw_relationship].downcase)
    if rel.save && type == "create"
      input.delete :raw_relationship
      input.merge!({ relationship_id: rel.id })
      FamilyMember.new(input)
    elsif rel.save && type == "update"
      input.delete :raw_relationship
      input.merge!({ relationship_id: rel.id })
      member.assign_attributes(input)
      member
    end
  end


end
