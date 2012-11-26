class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.decimal :longmin
      t.decimal :longmax
      t.decimal :latmin
      t.decimal :latmax
      t.text :iprange

      t.timestamps
    end
  end
end
