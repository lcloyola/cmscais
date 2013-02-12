class AddIsActiveToLogs < ActiveRecord::Migration
  def self.up
    add_column :logs, :is_active, :boolean, :default => true
  end
  def self.down
    remove_column :logs, :is_active
  end
end

