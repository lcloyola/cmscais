namespace :db do
  task :items => :environment do
    ["Server", "Files", "Announcement", "Points of Interest"].each do |i|
      props = {
        name: i
      }
      item = Item.create! props
    end
  end
end

