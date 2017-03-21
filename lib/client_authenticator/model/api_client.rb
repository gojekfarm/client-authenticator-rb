require 'active_record'

module ClientAuthenticator
  class ApiClient < ActiveRecord::Base
    self.table_name = 'client_authenticator_api_clients'
    validates_uniqueness_of :client_id
    validates_presence_of :client_id, :pass_key
    before_validation :generate_pass_key, on: :create

    def self.authenticate!(client_id, pass_key)
      where(client_id: client_id, pass_key: pass_key)
    end

    private

    def generate_pass_key
      self.pass_key = Digest::SHA1.hexdigest("#{client_id}-#{Time.now.to_i}-#{rand}")
    end
  end
end

