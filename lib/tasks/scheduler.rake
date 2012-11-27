desc "This task is called by the Heroku cron add-on"
task :call_page => :environment do
  require "net/http"
  require "uri"
  
  uri = URI.parse('http://andru.co/')
  Net::HTTP.get(uri)
end

desc "Remove cache"
task :remove_cache => :environment do
  include Rails.application.routes.url_helpers

  ApplicationController.expire_page pages_path
  Page.all.each do |page|
    ApplicationController.expire_page page_path(page.slug)
  end
  ApplicationController.expire_page '/'
  ApplicationController.expire_page archives_path
  FileUtils.rm_rf "#{ActionController::Base.page_cache_directory}/pages"
end