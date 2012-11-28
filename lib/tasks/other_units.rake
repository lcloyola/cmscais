namespace :db do
  task :other_units => :environment do
    files = ["syllabus1", "syllabus2", "syllabus3", "syllabus4", "handout1", "handout2", "handout3", "hw1", "hw2", "hw3", "reviewer1", "reviewer2", "reviewer3"]
    pois = ["marikina riverbank", "luneta park", "up diliman", "taekwando training center"]
    announcements = ["lacking highschool transcript", "unpaid misc fee", "lost and found iphone", "mr. y, see ms. x of guidance office", "sir C currently in a meeting at room 300"]

    alllocations = Location.all.count - 1

    files.each do |f|
      location = Location.find(rand(alllocations) + 1)
      props = { name: f, item_id: 2, user_id: 1, location_id: location.id, is_public: false}
      file = Unit.create! props
    end
    pois.each do |f|
      location = Location.find(rand(alllocations) + 1)
      props = { name: f, item_id: 4, user_id: 1, location_id: location.id, is_public: true}
      file = Unit.create! props
    end
    announcements.each do |f|
      location = Location.find(rand(alllocations) + 1)
      props = { name: f, item_id: 3, user_id: 1, location_id: location.id, is_public: true}
      file = Unit.create! props
    end


  end
end

