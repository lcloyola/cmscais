class CreateSublocations < ActiveRecord::Migration
  def change
    create_table :sublocations do |t|
      t.references :parent_id
      t.references :child_id
      t.text :remarks

      t.timestamps
    end
    add_index :sublocations, :parent_id_id
    add_index :sublocations, :child_id_id
  end
end
