namespace :nigs do
  task :items => :environment do
    traffic = Item.create!(:name => "Traffic Alerts")
    flood = Item.create!(:name => "Flood Alerts")
    weather = Item.create!(:name => "Weather Forcasts"),
    earthquake = Item.create!(:name => "Earthquake Warnings")
    tsunami = Item.create!(:name => "Tsunami Warnings")
    volcanic = Item.create!(:name => "Volcanic Level Alerts")
    cyclone = Item.create!(:name => "Cyclone Update")
    rain = Item.create!(:name => "Probability of Rain")
    homeworks = Item.create!(:name => "Homeworks")

    props = [
             ["status", "traffic remarks", "numerical value"],
             ["color code", "flood remarks", "numerical value"],
             ["status", "weather remarks"],
             ["intensity", "magnitude","depth", "lat", "long","earthquake remarks", "location", "datetime"],
             ["details"],
             ["level", "volcanic alert remarks"],
             ["roci", "beaufort scale", "MSW 1-min", "MSW 10-min","cyclone type", "cyclone signal", "cyclone lat", "cyclone long"],
             ["percent chance of rain"],
             ["title", "instructions", "due date"]]

    (0..8).each do |x|
      props[x].each do |p|
        Property.create!(:item_id => x + 1, :name => p, :datatype => 1)
      end
    end
    # ptraffic.each { |p| Property.create!(:item_id => traffic.id, :name => p, :datatype => 1)}
  end
end