# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Date::MONTHNAMES=[nil,"janvier","février","mars","avril","mai","juin","juillet","août","septembre","octobre","novembre","décembre"]


########### ADD BY THE TEAM ########
ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SENDGRID_LOGIN'],
  :password => ENV['SENDGRID_PWD'],
  :domain => 'https://meet-hop.herokuapp.com/',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
#######################################""
