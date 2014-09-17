module SureAuth
  class UserSessionsController < SureAuth::ApplicationController

    # sign in a user after successful auth.
    # this user data is requested within the sure strategy (lib/omniauth/strategy/sure.rb)
    def create
      omniauth = env['omniauth.auth']

      session[:user] = omniauth['info']
      session[:username] = omniauth['info']['username']
      session[:user_id] = omniauth['info']['id']
      session[:orametrix?] = omniauth['info']['orametrix?']
      session[:practice_roles] = omniauth['info']['practice_roles']

      redirect_to env['omniauth.origin'] || root_path
    end

    # provider auth failed
    def failure
      flash[:notice] = params[:message]
      redirect_to '/'
    end

    def destroy
      reset_session
      redirect_to "#{ENV['AUTH_PROVIDER_URL']}"
    end
  end
end
