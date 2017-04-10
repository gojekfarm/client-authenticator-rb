require 'active_support/concern'

module ClientAuthenticator
  module ApiAuthenticable
    extend ActiveSupport::Concern

    def authenticate_client!
      client_id = request.headers['client-id']
      pass_key = request.headers['pass-key']
      if client_id.nil? || pass_key.nil? || unauthorized?(client_id, pass_key)
        render json: {'error' => 'unauthorized'}, status: :unauthorized
      end
    end

    def unauthorized?(client_id, pass_key)
      ttl = ClientAuthenticator.configuration.cache_expiry_duration
      Rails.cache.fetch("#{client_id}_#{pass_key}", expires_in: ttl) do
        not ApiClient.authenticated?(client_id, pass_key)
      end
    end

  end
end
