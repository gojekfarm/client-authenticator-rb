require 'securerandom'
require 'rails/generators'
require 'rails/generators/base'
require 'rails/generators/active_record'

module InternalApiAuthenticator
  class InstallGenerator < Rails::Generators::Base
    include ActiveRecord::Generators::Migration

    source_root File.expand_path('../templates', __FILE__)

    def create_migrations
      Dir["#{self.class.source_root}/migrations/*.rb"].sort.each do |filepath|
        name = File.basename(filepath)
        auth_config = InternalApiAuthenticator.configuration
        destination_name = "db/migrate/#{name}"
        config = { table_name: auth_config.table_name, client_id_field: auth_config.password_field, password_field: auth_config.client_id_field }
        migration_template "migrations/#{name}", destination_name, config
        sleep 1
      end
    end
  end
end
