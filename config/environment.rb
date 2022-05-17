# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  address: ENV['MAILGUN_SMTP_SERVER'],
  port: ENV['MAILGUN_SMTP_PORT'],
  domain: 'radiant-thicket-85951.herokuapp.com/',
  user_name: ENV['MAILGUN_SMTP_LOGIN'],
  password: ENV['MAILGUN_SMTP_PASSWORD'],
  authenication: :plain,
  enable_starttls_auto: true
}
