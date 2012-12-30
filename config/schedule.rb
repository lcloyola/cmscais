require 'rails/all'
# whenever --update-crontab store

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

#set :output, "/path/to/my/cron_log.log"
set :environment, Rails.env

#every 2.hours do
every '04 20 * * *' do
   rake "db:send_updates"
end

#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# every 1.day, :at => '4:30 am' do
#  runner "MyModel.task_to_run_at_four_thirty_in_the_morning"
#end

# every :hour do # Many shortcuts available: :hour, :day, :month, :year, :reboot
#  runner "SomeModel.ladeeda"
# end

# every :sunday, :at => '12pm' do # Use any day of the week or :weekend, :weekday
#  runner "Task.do_something_great"
# end

# every '0 0 27-31 * *' do
#  command "echo 'you can use raw cron syntax too'"
# end

# run this task only on servers with the :app role in Capistrano
# see Capistrano roles section below
# every :day, :at => '12:20am', :roles => [:app] do
#  rake "app_server:task"
# end

