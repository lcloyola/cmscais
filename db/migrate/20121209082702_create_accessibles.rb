class CreateAccessibles < ActiveRecord::Migration
  def change
    create_table :accessibles do |t|
      t.references :unit
      t.references :user

      t.timestamps
    end
    add_index :accessibles, :unit_id
    add_index :accessibles, :user_id
  end
end
