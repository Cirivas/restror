# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['EMAIL_USERNAME'],
  :password => ENV['EMAIL_PASSWORD'],
  :domain => 'restror.herokuapp.com',
  :address => ENV['EMAIL_ADDRESS'],
  :port => ENV['EMAIL_PORT'],
  :authentication => :plain,
  :enable_starttls_auto => true
}
