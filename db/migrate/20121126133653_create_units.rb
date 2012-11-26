class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.references :item
      t.references :user
      t.references :location
      t.string :name
      t.boolean :is_public
      t.text :remarks

      t.timestamps
    end
    add_index :units, :item_id
    add_index :units, :user_id
    add_index :units, :location_id
  end
end
