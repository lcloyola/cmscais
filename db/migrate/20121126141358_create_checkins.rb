class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.references :user
      t.references :location
      t.text :remarks

      t.timestamps
    end
    add_index :checkins, :user_id
    add_index :checkins, :location_id
  end
end
