# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Blog::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true 
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.default_url_options = { host: Blog::URL }

ActionMailer::Base.smtp_settings = {
  :port           => Blog::SMTP_PORT, 
  :address        => Blog::SMTP_ADDRESS,
  :user_name      => Blog::SMTP_USER_NAME,
  :password       => Blog::SMTP_PASSWORD,
  :domain         => Blog::SMTP_DOMAIN,
  :authentication => Blog::SMTP_AUTHENTICATION
}