require 'omniauth-oauth2'

class OmniAuth::Strategies::Sure < OmniAuth::Strategies::OAuth2
  option :name, 'sure'

  option :client_options, {
    site: ENV['AUTH_PROVIDER_URL'],
    authorize_path: '/oauth/authorize',
    access_token_path: '/oath/token'
  }

  info do
    {
      id: raw_user_info['id'],
      username: raw_user_info['username'],
      orametrix?: raw_user_info['orametrix?'],
      practice_roles: raw_user_info['practices_roles']
    }
  end

  # after successful auth, get data from provider app
  def raw_user_info
    @raw_user_info ||= access_token.get('/me').parsed
  end
end
