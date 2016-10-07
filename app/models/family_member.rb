class FamilyMember < ApplicationRecord
  belongs_to :relationship

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :birthdate
  validates_presence_of :relationship_id
  validates_uniqueness_of :first_name, scope: :last_name
  
  def formatteed_relationship
    relationship.rel_type.capitalize
  end
end
