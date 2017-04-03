require 'spec_helper'

RSpec.describe InternalApiAuthenticator::ApiAuthenticable do

  include InternalApiAuthenticator::ApiAuthenticable

  class Request
    def initialize(hdrs)
      @headers = hdrs 
    end
    attr_accessor :headers
  end

  class Authorizer 
    include InternalApiAuthenticator::ApiAuthenticable
    attr_accessor :request
    def render(opts)
    end
  end

  context 'client authentication' do
    let(:client_id) { 'clientid' }
    let(:pass_key) { 'pass_key' }
    let(:header) { {'client-id': client_id, 'pass-key': pass_key}.with_indifferent_access }
    let(:request) { Request.new(header) }
    let(:auth) { auth = Authorizer.new
                 auth.request = request
                 auth
    }

    context 'when client id and pass key is sent' do
      it 'when authorised, should not render 401' do
        expect(InternalApiAuthenticator::ApiClient).to receive(:authenticated?).with(client_id, pass_key).and_return(true)
        expect(auth).not_to receive(:render)

        auth.authenticate_client!
      end

      it 'when no authenticate fails' do
        expected_opts = {:json=>{"error"=>"unauthorized"}, :status=>:unauthorized}
        expect(InternalApiAuthenticator::ApiClient).to receive(:authenticated?).with(client_id, pass_key).and_return(false)
        expect(auth).to receive(:render).with(expected_opts)

        auth.authenticate_client!
      end
    end


    context 'when client id is not passed' do
      let(:client_id) { nil }
      it 'should render 401' do
        expect(InternalApiAuthenticator::ApiClient).not_to receive(:authenticated?)
        auth.authenticate_client!
      end
    end

    context 'when client id is not passed' do
      let(:pass_key) { nil }
      it 'should render 401' do
        expect(InternalApiAuthenticator::ApiClient).not_to receive(:authenticated?)
        auth.authenticate_client!
      end
    end

  end
end
