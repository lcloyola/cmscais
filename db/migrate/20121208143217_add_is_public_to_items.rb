class AddIsPublicToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :is_public, :boolean, :default => true
  end
  def self.down
    remove_column :items, :is_public
  end
end

