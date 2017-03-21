require 'internal_api_authenticator'
require 'rails'

module InternalApiAuthenticator
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/generate_client_credentials.rake'
    end
  end
end