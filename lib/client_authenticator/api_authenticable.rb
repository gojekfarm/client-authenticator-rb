require 'active_support/concern'

module ClientAuthenticator
  extend ActiveSupport::Concern

  def authenticate_client!
    client_id = request.headers['client-id']
    pass_key = request.headers['pass-key']
    if client_id.nil? || pass_key.nil? || (not ApiClient.authenticated?(client_id, pass_key))
      render json: {'error' => 'unauthorized'}, status: :unauthorized
    end
  end
end
