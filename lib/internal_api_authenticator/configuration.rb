module InternalApiAuthenticator

  class Configuration
    def initialize()
      @table_name = 'whitelisted_clients'
    end

    attr_accessor :table_name
  end

  def configuration
    @config ||= Configuration.new
  end

  def configure
    yield(configuration)
  end
end
