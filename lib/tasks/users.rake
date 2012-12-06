namespace :db do
  task :users => :environment do
    require 'ffaker'
    require 'devise'
    a = User.create!(:email => "admin@admin.com", :password => "pass.1")
    a.admin = true

    100.times do
      props = {
        email: Faker::Internet.email,
        password: "pass.1"
      }
      user = User.create! props
    end
  end
end

