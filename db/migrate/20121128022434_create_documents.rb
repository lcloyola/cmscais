class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :unit
      t.string :name
      t.text :remarks
      t.attachment :file

      t.timestamps
    end
    add_index :documents, :unit_id
  end
end
