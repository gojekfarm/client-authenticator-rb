# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'internal_api_authenticator/version'

Gem::Specification.new do |spec|
  spec.name          = "internal_api_authenticator"
  spec.version       = InternalApiAuthenticator::VERSION
  spec.authors       = ["manoharakshetty"]
  spec.email         = ["manohara@go-jek.com"]
  spec.summary       = %q{ruby gem for authentication of inter-client communication }
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "factory_girl_rails"
  spec.add_development_dependency "shoulda-matchers"
end
