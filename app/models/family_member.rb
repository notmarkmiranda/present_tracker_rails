class FamilyMember < ApplicationRecord
  belongs_to :relationship

  def formatteed_relationship
    relationship.rel_type.capitalize
  end
end
