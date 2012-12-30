namespace :db do
  task :send_updates => :environment do
    #require 'ffaker'
    #require 'devise'
    #a = User.create!(:email => "blahblah12@admin.com", :password => "pass.1")
    SendUpdate.last.present? ? last_update = SendUpdate.last.schedule : last_update = Time.now
    puts last_update
    #Unit.with_changes(last_update).each do |u|
    #  puts u.name
    #end
    #puts Unit.all.to_json
    SendUpdate.create!(:schedule => Time.now)
  end
end

