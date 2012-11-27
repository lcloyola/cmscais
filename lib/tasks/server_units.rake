namespace :db do
  task :server_units => :environment do
    # SERVERS
    vmsA = ["proxy2", "proxy4", "proxy6", "proxy8", "superproxy"]
    vmsB = ["irrashai", "foss.upd", "dns server", "mailserver1"]
    vmsC = ["dormproxy", "webserver1"]
    vmsD = ["webserver2", "webserver3"]
    vmsE = ["pleni", "chao"]

    upcc1 = Location.create!(:name => "UPCC Basement", :longmin => 126.60438370, :longmax => 116.70291930, :latmin => 19.57402410, :latmax => 4.613444299999999)
    upcc2 = Location.create!(:name => "UPCC 2nd Floor", :longmin => 126.60438370, :longmax => 116.70291930, :latmin => 19.57402410, :latmax => 4.613444299999999)
    eee1 = Location.create!(:name => "EEE Basement", :longmin => 126.60438370, :longmax => 116.70291930, :latmin => 19.57402410, :latmax => 4.613444299999999)
    eee2 = Location.create!(:name => "EEE 2nd Floor", :longmin => 126.60438370, :longmax => 116.70291930, :latmin => 19.57402410, :latmax => 4.613444299999999)

    serverA = Unit.create!(:item_id => 1, :user_id => 1, :location_id => upcc1.id, :name => "Server A", :is_public => false)
    serverB = Unit.create!(:item_id => 1, :user_id => 1, :location_id => upcc1.id, :name => "Server B", :is_public => false)
    serverC = Unit.create!(:item_id => 1, :user_id => 1, :location_id => upcc2.id, :name => "Server C", :is_public => true)
    serverD = Unit.create!(:item_id => 1, :user_id => 1, :location_id => eee1.id, :name => "Server D", :is_public => true)
    serverE = Unit.create!(:item_id => 1, :user_id => 1, :location_id => eee2.id, :name => "Server E", :is_public => true)

    vmsA.each do |vm|
      props = { name: vm, item_id: 1, user_id: 1, location_id: upcc1.id, is_public: false}
      server = Unit.create! props
      Subunit.create!(:child_id => server.id, :parent_id => serverA.id, :relationship => "vm", :remarks => Faker::Lorem.sentence(8))
    end
    vmsB.each do |vm|
      props = { name: vm, item_id: 1, user_id: 1, location_id: upcc1.id, is_public: false}
      server = Unit.create! props
      Subunit.create!(:child_id => server.id, :parent_id => serverB.id, :relationship => "vm", :remarks => Faker::Lorem.sentence(8))
    end
    vmsC.each do |vm|
      props = { name: vm, item_id: 1, user_id: 1, location_id: upcc2.id, is_public: true}
      server = Unit.create! props
      Subunit.create!(:child_id => server.id, :parent_id => serverC.id, :relationship => "vm", :remarks => Faker::Lorem.sentence(8))
    end
    vmsD.each do |vm|
      props = { name: vm, item_id: 1, user_id: 1, location_id: eee1.id, is_public: true}
      server = Unit.create! props
      Subunit.create!(:child_id => server.id, :parent_id => serverD.id, :relationship => "vm", :remarks => Faker::Lorem.sentence(8))
    end
    vmsE.each do |vm|
      props = { name: vm, item_id: 1, user_id: 1, location_id: eee2.id, is_public: true}
      server = Unit.create! props
      Subunit.create!(:child_id => server.id, :parent_id => serverE.id, :relationship => "vm", :remarks => Faker::Lorem.sentence(8))
    end
  end
end

