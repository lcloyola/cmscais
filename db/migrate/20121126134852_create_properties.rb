class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.references :item
      t.string :name
      t.text :remarks
      t.integer :datatype

      t.timestamps
    end
    add_index :properties, :item_id
  end
end
