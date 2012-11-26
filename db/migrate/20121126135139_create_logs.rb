class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :unit
      t.references :properties
      t.text :value

      t.timestamps
    end
    add_index :logs, :unit_id
    add_index :logs, :properties_id
  end
end
