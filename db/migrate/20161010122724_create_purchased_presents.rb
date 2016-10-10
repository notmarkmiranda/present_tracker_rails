class CreatePurchasedPresents < ActiveRecord::Migration[5.0]
  def change
    create_table :purchased_presents do |t|
      t.references :family_member, foreign_key: true
      t.references :present, foreign_key: true
      t.references :occasion, foreign_key: true
    end
  end
end
