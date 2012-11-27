desc "This task is called by the Heroku cron add-on"
task :call_page => :environment do
  require "net/http"
  require "uri"
  
  uri = URI.parse('http://andru.co/')
  Net::HTTP.get(uri)
end