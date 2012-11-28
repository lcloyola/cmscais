namespace :db do
  task :items => :environment do
    server = Item.create!(:name => "server")
    files = Item.create!(:name => "files")
    alerts = Item.create!(:name => "announcements")
    poi = Item.create!(:name => "points of interest")

    serverp = ["uptime", "temp", "memory", "swap", "storage", "load average", "ipaddress", "mac address"]
    filep = ["subject", "summary", "objective"]
    annp = ["status", "comment"]
    poip = ["address", "history", "population", "temperature", "traffic", "comment"]

    serverp.each do |p|
      Property.create!(:item_id => server.id, :name => p, :datatype => 1)
    end
    filep.each do |p|
      Property.create!(:item_id => files.id, :name => p, :datatype => 1)
    end
    annp.each do |p|
      Property.create!(:item_id => alerts.id, :name => p, :datatype => 1)
    end
    poip.each do |p|
      Property.create!(:item_id => poi.id, :name => p, :datatype => 1)
    end
  end
end

