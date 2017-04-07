require 'client_authenticator'
require 'rails'

module ClientAuthenticator
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/generate_client_credentials.rake'
    end
  end
end
