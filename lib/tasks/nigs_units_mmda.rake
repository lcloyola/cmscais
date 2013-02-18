namespace :nigs do
  task :units_mmda => :environment do
    traffic = Item.find(1)
    status = traffic.properties.find_by_name("status")
    statletters = ["H", "L", "L-M", "M-H", "M"]
    File.open("#{Rails.public_path}/mmda_units.txt", "r").each_line do |line|
      data = line.gsub("\n","")
      unit = traffic.units.create!(:name => data, :user_id => 1)
      3.times do
        unit.logs.create!(:property_id => status.id, :value => statletters[rand(4) + 1], :is_active => false)
      end
      Log.last.update_attribute(:is_active, true)
    end
  end
end