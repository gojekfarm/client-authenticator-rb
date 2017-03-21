require 'internal_api_authenticator/model/api_client'

desc "Usage 'rake generate_api_client_credentials['client_id']'"
namespace 'internal_api_authenticator' do
  task :generate_api_client_credentials, [:client_id] => [:environment] do |t, args|
    abort "Usage: rake 'generate_api_client_credentials['client_id']'" if args[:client_id].blank?
    api_client = InternalApiAuthenticator::ApiClient.create(client_id: args[:client_id])
    if api_client.valid?
      puts "The api secret for #{args[:client_id]} is #{api_client.pass_key}"
    else
      puts "Error: #{api_client.errors.messages}"
    end
  end
end
