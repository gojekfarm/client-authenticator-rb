require 'spec_helper'

RSpec.describe ClientAuthenticator do

  include ClientAuthenticator::ApiAuthenticable

  class Request
    def initialize(hdrs)
      @headers = hdrs 
    end
    attr_accessor :headers
  end

  class Authorizer 
    include ClientAuthenticator::ApiAuthenticable
    attr_accessor :request
    def render(opts)
    end
  end

  context 'client authentication' do
    let!(:client_id) { 'clientid' }
    let!(:pass_key) { 'pass_key' }
    let(:header) { {'client-id': client_id, 'pass-key': pass_key}.with_indifferent_access }
    let(:request) { Request.new(header) }
    let(:auth) { auth = Authorizer.new
                 auth.request = request
                 auth
    }
    let(:cache) { double('cache') }


    context 'when client id and pass key is sent' do
    before(:each) do
      expect(Rails).to receive(:cache) { cache }
      expect(cache).to receive(:fetch).with("#{client_id}_#{pass_key}", { expires_in: 12.hours}) do |&block|
        block.call
      end
    end

      it 'when authorised, should not render 401' do
        expect(ClientAuthenticator::ApiClient).to receive(:authenticated?).with(client_id, pass_key).and_return(true)
        expect(auth).not_to receive(:render)

        auth.authenticate_client!
      end

      it 'when no authenticate fails' do
        expected_opts = {:json=>{"error"=>"unauthorized"}, :status=>:unauthorized}
        expect(ClientAuthenticator::ApiClient).to receive(:authenticated?).with(client_id, pass_key).and_return(false)
        expect(auth).to receive(:render).with(expected_opts)

        auth.authenticate_client!
      end
    end


    context 'when client id is not passed' do
      let(:client_id) { nil }
      it 'should render 401' do
        expect(ClientAuthenticator::ApiClient).not_to receive(:authenticated?)
        auth.authenticate_client!
      end
    end

    context 'when client id is not passed' do
      let(:pass_key) { nil }
      it 'should render 401' do
        expect(ClientAuthenticator::ApiClient).not_to receive(:authenticated?)
        auth.authenticate_client!
      end
    end

  end
end
