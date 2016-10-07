class CreateFamilyMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :family_members do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.references :relationship, foreign_key: true
    end
  end
end
