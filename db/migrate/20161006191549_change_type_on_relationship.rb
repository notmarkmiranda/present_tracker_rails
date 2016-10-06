class ChangeTypeOnRelationship < ActiveRecord::Migration[5.0]
  def change
    change_table :relationships do |t|
      t.rename :type, :rel_type
    end
  end
end
