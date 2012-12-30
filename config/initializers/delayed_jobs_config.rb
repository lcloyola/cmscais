# http://www.dixis.com/?p=335
# https://github.com/collectiveidea/delayed_job

Delayed::Worker.destroy_failed_jobs = false
#Delayed::Worker.sleep_delay = 60
Delayed::Worker.max_attempts = 3
Delayed::Worker.max_run_time = 10.minutes

