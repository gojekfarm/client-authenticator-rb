require 'active_support/concern'

module InternalApiAuthenticator
  module ApiAuthenticable
    extend ActiveSupport::Concern

    def authenticate_client!
      client_id = request.headers['client-id']
      pass_key = request.headers['pass-key']
      unless client_id.present? && pass_key.present? &&  InternalApiAuthenticator::ApiClient.authenticate!(client_id, pass_key)
        render json: {'error' => 'unauthorized'}, status: :unauthorized
      end
    end
  end
end