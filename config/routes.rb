Rails.application.routes.draw do 
	# sent here by provider after successful authentication
	get '/auth/:provider/callback' => 'sure_auth/user_sessions#create'
	
	# sent here by provider after failded authentication
	get '/auth/failure' => 'sure_auth/user_sessions#failure'

	post '/logout' => 'sure_auth/user_sessions#destroy', as: 'logout'
end