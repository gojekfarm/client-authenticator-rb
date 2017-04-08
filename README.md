# Client Authenticator
[![Build Status](https://travis-ci.org/gojek-engineering/client-authenticator-rb.svg?branch=master)](https://travis-ci.org/gojek-engineering/client-authenticator-rb)

A gem to authenticate your service clients via headers `client-id, pass-key` before processing api requests.

## Installation

```ruby
gem 'client_authenticator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install client_authenticator

## Usage

Next, you need to run the generator:

    `$ rails generate client_authenticator:install`

It will add a migration to create api_clients model.

Then run `rake db:migrate `

Add following to to controller/base controller where you want clients to be authenticated for all api class

  `include ClientAuthenticator::ApiAuthenticable`

for test to pass in above controllers you can use the test_helper methods `stub_valid_client_credentials` and `stub_invalid_client_credentials`(Add `config.include InternalApiAuthenticator::TestHelpers` to rails_helper file, so that the test_helper methods are available)

Gem provides a easy way to create the client credentials. You can run following rake task to generate client credentials.

`$ bundle exec rake 'client_authenticator:generate_api_client_credentials[CLIENT_ID]'`

## Contributing

1. Fork it ( https://github.com/gojek-engineeering/client_authenticator-rb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
6. Create Issues if you find any or for enhancement requests
