require 'simplecov'
SimpleCov.start
SimpleCov.minimum_coverage 88

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'generator_spec'
require 'client_authenticator'
require 'generators/client_authenticator/install_generator'
