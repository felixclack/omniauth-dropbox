require 'omniauth-oauth2'
require 'json'

module OmniAuth
  module Strategies
    class Dropbox < OmniAuth::Strategies::OAuth2
      option :name, 'dropbox'
      option :client_options, {
        site: 'https://api.dropbox.com',
        authorize_url: 'https://www.dropbox.com/1/oauth2/authorize',
        token_url: 'https://api.dropbox.com/1/oauth2/token'
      }

      uid { raw_info['uid'].to_s }

      info do
        {
          uid: raw_info['uid'],
          name: raw_info['display_name'],
          email: raw_info['email']
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= JSON.parse(access_token.get('/1/account/info').body)
      end
    end
  end
end

