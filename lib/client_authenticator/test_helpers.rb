require 'client_authenticator'

module ClientAuthenticator
  module TestHelper
    def stub_valid_client_credentials
      expect(ClientAuthenticator::ApiClient).to receive(:authenticate!).with('client_id', 'valid_pass_key').and_return(true)
      @request.headers['client-id'] = 'client_id'
      @request.headers['pass-key'] = 'valid_pass_key'
    end

    def stub_invalid_client_credentials
      expect(ClientAuthenticator::ApiClient).to receive(:authenticate!).with('client_id', 'invalid_pass_key').and_return(false)
      @request.headers['client-id'] = 'client_id'
      @request.headers['pass-key'] = 'invalid_pass_key'
    end
  end
end