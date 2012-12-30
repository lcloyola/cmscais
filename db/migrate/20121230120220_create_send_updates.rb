class CreateSendUpdates < ActiveRecord::Migration
  def change
    create_table :send_updates do |t|
      t.datetime :schedule

      t.timestamps
    end
  end
end
