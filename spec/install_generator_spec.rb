require 'spec_helper'

module ClientAuthenticator
  describe InstallGenerator, type: :genearator do
  include GeneratorSpec::TestCase
    root_dir = File.expand_path("../tmp", __FILE__)
    destination root_dir

    before(:all) do
      prepare_destination
      run_generator
    end

    it 'should generate migration with expected default content' do
      migration_file = Dir.glob("#{root_dir}/db/migrate/*create_api_clients.rb")
      expect(migration_file.first).not_to be_nil
      expect(File.read(migration_file.first)).to eq(expected_migration)
    end

    def expected_migration
"class CreateApiClients < ActiveRecord::Migration
  def change
    create_table :whitelisted_clients do |t|
      t.string :pass_key, unique: true
      t.string :client_id, unique: true

      t.timestamps null: false
    end
  end
end
"
    end

  end
end

