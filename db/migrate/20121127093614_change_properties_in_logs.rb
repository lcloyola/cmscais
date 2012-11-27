class ChangePropertiesInLogs < ActiveRecord::Migration
  def up
    remove_index :logs, :column => [:properties_id]
    remove_column :logs, :properties_id
    add_column :logs, :property_id, :integer

    add_index :logs, :property_id
  end
end

