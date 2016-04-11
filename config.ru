# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application

if Rails.env.development? || Rails.env.production?
  auth_username = ENV.fetch("DJ_ADMIN_USERNAME")
  auth_password = ENV.fetch("DJ_ADMIN_PASSWORD")

  DelayedJobWeb.use Rack::Auth::Basic do |username, password|
    username == auth_username && password == auth_password
  end
end
