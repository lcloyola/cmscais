namespace :db do
  task :send_updates => :environment do
    SendUpdate.last.present? ? last_update = SendUpdate.last.schedule : last_update = Time.now
    puts last_update
    Unit.with_changes(last_update).each do |u|
      puts u.name
    end

    @body = {:last_update => last_update,
             :units => Unit.with_changes(last_update),
             :items => Item.with_changes(last_update),
             :locations => Location.with_changes(last_update),
             :properties => Property.with_changes(last_update),
             :logs => Log.with_changes(last_update),
             :users => User.with_changes(last_update),
             :documents => Document.with_changes(last_update)
             }

    puts @body.to_json
    SendUpdate.perform(@body.to_json)
    SendUpdate.create!(:schedule => Time.now)
  end
end

