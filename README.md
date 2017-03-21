# InternalApiAuthenticator

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'internal_api_authenticator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install internal_api_authenticator

## Usage

Next, you need to run the generator:

    `$ rails generate internal_api_authenticator:install`

It will add a migration to create api_clients model.

Then run `rake db:migrate `

Add following to to controller/base controller where you want clients to be authenticated for all api class

  `include InternalApiAuthenticator::ClientAuthenticable`

for test to pass in above controllers you can use the test_helper methods `stub_valid_client_credentials` and `stub_valid_client_credentials`

Add `config.include InternalApiAuthenticator::TestHelpers` to rails_helper file, so that the test_helper methods are available.

TODO: Add generator to automate all above task like including controller concern and test_helpers

## Contributing

1. Fork it ( https://github.com/[my-github-username]/internal_api_authenticator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
