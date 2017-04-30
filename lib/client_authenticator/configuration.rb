module ClientAuthenticator

  class Configuration
    def initialize()
      @table_name = 'whitelisted_clients'
      @client_id_field = 'client_id'
      @password_field = 'pass_key'
      @cache_expiry_duration = 12.hours
      @client_id_header = 'client-id'
      @pass_key_header = 'pass-key'
    end

    attr_accessor :table_name, :client_id_field, :password_field,
      :cache_expiry_duration, :client_id_header, :pass_key_header
  end

  def self.configuration
    @config ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.reset
    @config = Configuration.new
  end
end
