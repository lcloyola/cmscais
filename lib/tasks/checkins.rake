namespace :db do
  task :checkins => :environment do
    allusers = User.all.count - 1
    alllocations = Location.all.count - 1
    30.times do
      user = User.find(rand(allusers) + 2)
      location = Location.find(rand(alllocations) + 1)
      props = {
        remarks: Faker::Lorem.sentence(8),
        location_id: location.id,
        user_id: user.id
      }
      checkin = Checkin.create! props
    end
  end
end

