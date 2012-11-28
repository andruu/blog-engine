desc "This task is called by the Heroku cron add-on"
task :call_page => :environment do
  require "net/http"
  require "uri"
  
  uri = URI.parse("http://#{Blog::URL}/")
  Net::HTTP.get(uri)
end

namespace :clear_cache do
  desc "Remove page cache"
  task :page => :environment do
    include Rails.application.routes.url_helpers

    ApplicationController.expire_page pages_path
    Page.all.each do |page|
      ApplicationController.expire_page page_path(page.slug)
    end
    ApplicationController.expire_page '/'
    ApplicationController.expire_page archives_path
    FileUtils.rm_rf "#{ActionController::Base.page_cache_directory}/pages"
  end

  desc "Remove action cache"
  task :action => :environment do
    # Still need to implement
  end
end