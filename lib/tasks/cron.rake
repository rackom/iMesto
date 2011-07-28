desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  puts "Downloading news ..."
  Message.download_news
  puts "Downloading completed."
end
