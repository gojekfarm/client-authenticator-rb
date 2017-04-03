require "internal_api_authenticator/version"
require 'internal_api_authenticator/api_authenticable'
require 'internal_api_authenticator/configuration'
require 'internal_api_authenticator/model/api_client'
require 'internal_api_authenticator/railtie'
require 'internal_api_authenticator/test_helpers'

module InternalApiAuthenticator
  require "internal_api_authenticator/railtie" if defined?(Rails)
end
