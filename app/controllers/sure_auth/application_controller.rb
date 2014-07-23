module SureAuth
	class ApplicationController < ActionController::Base
		protect_from_forgery

		# use this method as a before_action in
		# your client controllers to secure them
		def login_required
			not_authorized unless session[:user_id]
		end

		def not_authorized
			respond_to do |format|
				# start authorization with sure provider
				format.html { redirect_to "/auth/sure?origin=#{request.original_url}" }
				format.json { head :unauthorized }
			end
		end
	end
end
