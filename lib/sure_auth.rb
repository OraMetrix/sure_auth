$:.unshift(File.expand_path('../../app/controllers', __FILE__))

require 'sure_auth/application_controller'
require 'sure_auth/user_sessions_controller'
require 'omniauth/strategy/sure'
require 'sure_auth/engine'

module SureAuth
end
