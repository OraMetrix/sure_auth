require 'sure_auth'

APP_ID = ENV['AUTH_PROVIDER_APPLICATION_ID'] || 'fake_id'
APP_SECRET = ENV['AUTH_PROVIDER_SECRET'] || 'fake_secret'

Rails.application.config.middleware.use OmniAuth::Builder do 
	provider :sure, APP_ID, APP_SECRET
end