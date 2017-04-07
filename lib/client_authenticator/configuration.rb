module ClientAuthenticator

  class Configuration
    def initialize()
      @table_name = 'whitelisted_clients'
      @client_id_field = 'client_id'
      @password_field = 'pass_key'
    end

    attr_accessor :table_name, :client_id_field, :password_field
  end

  def self.configuration
    @config ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
