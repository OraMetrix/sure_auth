module SureAuth
	class ApplicationController < ActionController::Base
		before_action :check_cookie

		protect_from_forgery

		# use this method as a before_action in
		# your client controllers to secure them
		def login_required
			not_authorized unless valid_cookie
		end

		def not_authorized
			respond_to do |format|
				# start authorization with sure provider
				format.html { redirect_to "/auth/sure?origin=#{request.original_url}" }
				format.json { head :unauthorized }
			end
		end

		private

			# use a cookie to check if a user
			# has signed out on another related app
			def check_cookie
				reset_session unless valid_cookie
			end

			def valid_cookie
				cookies['sure_auth'].present? &&
				session[:user_id].present? &&
				cookies['sure_auth'].to_s == session[:user_id].to_s
			end
	end
end
