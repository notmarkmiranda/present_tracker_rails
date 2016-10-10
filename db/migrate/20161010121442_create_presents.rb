class CreatePresents < ActiveRecord::Migration[5.0]
  def change
    create_table :presents do |t|
      t.string :name
      t.string :link
      t.decimal :price
      t.integer :quantity
    end
  end
end
