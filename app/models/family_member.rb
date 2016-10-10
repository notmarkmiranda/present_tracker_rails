class FamilyMember < ApplicationRecord
  default_scope { order('first_name ASC') }
  before_validation :strip_and_downcase, only: [:first_name, :last_name]
  belongs_to :relationship

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :birthdate
  validates_presence_of :relationship_id
  validates_uniqueness_of :first_name, scope: :last_name, case_sensitive: false

  def formatted_relationship
    relationship.rel_type.upcase
  end

  def raw_relationship
    relationship.rel_type if relationship
  end

  def age
    now = Date.today.to_date
    now.year - birthdate.year - (birthdate.to_date.change(year: now.year) >= now ? 1 : 0)
  end

  def days_until
    now = Date.today.to_date
    if birthdate.to_date.change(year: now.year) > now
      bd = birthdate.to_date.change(year: now.year)
      (bd - now).to_i
    else
      bd = birthdate.to_date.change(year: now.year + 1)
      (bd - now).to_i
    end
  end

  def self.sorted_by_days_until
    FamilyMember.all.sort_by(&:days_until)
  end

  private

  def strip_and_downcase
    self.first_name = self.first_name.strip.downcase unless self.first_name.nil?
    self.last_name = self.last_name.strip.downcase unless self.last_name.nil?
  end
end
