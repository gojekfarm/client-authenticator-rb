require 'active_support/concern'

module InternalApiAuthenticator
  module ApiAuthenticable
    extend ActiveSupport::Concern

    included do
      before_action :authenticate_client!
    end

    def authenticate_client!
      client_id = request.headers['client-id']
      unless client_id.present? && InternalApiAuthenticator::ApiClient.authenticate!(client_id, request.headers['pass-key'])
        render json: {'error' => 'unauthorized'}, status: :unauthorized
      end
    end
  end
end