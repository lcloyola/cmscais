class ChangeDecimalToFloatInLocations < ActiveRecord::Migration
  def up
    remove_column :locations, :longmin
    remove_column :locations, :latmin
    remove_column :locations, :longmax
    remove_column :locations, :latmax
    add_column :locations, :longmin, :float, :limit => 25
    add_column :locations, :latmin, :float, :limit => 25
    add_column :locations, :longmax, :float, :limit => 25
    add_column :locations, :latmax, :float, :limit => 25
  end
end

