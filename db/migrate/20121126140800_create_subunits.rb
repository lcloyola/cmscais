class CreateSubunits < ActiveRecord::Migration
  def change
    create_table :subunits do |t|
      t.references :parent
      t.references :child
      t.string :relationship
      t.text :remarks

      t.timestamps
    end
    add_index :subunits, :parent_id
    add_index :subunits, :child_id
  end
end
