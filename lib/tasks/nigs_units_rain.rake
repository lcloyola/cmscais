namespace :nigs do
  task :units_rain => :environment do
    rain = Item.find(8)
    prob = rain.properties.first
    File.open("#{Rails.public_path}/rain_units.txt", "r").each_line do |line|
      data = line.gsub("\n","")
      unit = rain.units.create!(:name => data, :user_id => 1)
      3.times do
        unit.logs.create!(:property_id => prob.id, :value => (rand(99) + 1), :is_active => false)
      end
      Log.last.update_attribute(:is_active, true)
    end
  end
end