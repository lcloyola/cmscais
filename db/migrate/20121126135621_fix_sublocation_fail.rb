class FixSublocationFail < ActiveRecord::Migration
  def up
    remove_index :sublocations, :column => [:parent_id_id]
    remove_index :sublocations, :column => [:child_id_id]
    remove_column :sublocations, :parent_id_id
    remove_column :sublocations, :child_id_id
    add_column :sublocations, :parent_id, :integer
    add_column :sublocations, :child_id, :integer

    add_index :sublocations, :parent_id
    add_index :sublocations, :child_id
  end
end

