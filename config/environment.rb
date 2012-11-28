# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Blog::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true 
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.default_url_options = { host: "andru.co" }

ActionMailer::Base.smtp_settings = {
  :port           => ENV['MAILGUN_SMTP_PORT'], 
  :address        => ENV['MAILGUN_SMTP_SERVER'],
  :user_name      => ENV['MAILGUN_SMTP_LOGIN'],
  :password       => ENV['MAILGUN_SMTP_PASSWORD'],
  :domain         => 'app9499505.mailgun.org',
  :authentication => :plain,
}