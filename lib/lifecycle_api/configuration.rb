module Lifecycle
  module Configuration
    VALID_CONNECTION_KEYS = [:endpoint, :user_agent, :method].freeze
    VALID_OPTIONS_KEYS    = [:api_key, :format].freeze
    VALID_CONFIG_KEYS     = VALID_CONNECTION_KEYS + VALID_OPTIONS_KEYS

    # DEFAULT_ENDPOINT    = 'http://api-test.lifecycle.io/v1'
    DEFAULT_ENDPOINT    = 'http://localhost:3400'
    DEFAULT_METHOD      = :post
    DEFAULT_USER_AGENT  = "Lifecycle API Ruby Gem #{Lifecycle::VERSION}".freeze

    DEFAULT_API_KEY      = nil
    DEFAULT_FORMAT       = :json

    # Build accessor methods for every config options so we can do this, for example:
    #   Awesome.format = :xml
    attr_accessor *VALID_CONFIG_KEYS

    # Make sure we have the default values set when we get 'extended'
    def self.extended(base)
      base.reset
    end

    def reset
      self.endpoint   = DEFAULT_ENDPOINT
      self.method     = DEFAULT_METHOD
      self.user_agent = DEFAULT_USER_AGENT

      self.api_key    = DEFAULT_API_KEY
      self.format     = DEFAULT_FORMAT
    end
    def configure
      yield self
    end
    # implement a method that returns all the configuration values inside the Lifecycle module
    # this seems unessasary TODO: refactor/remove this method
    def options
      Hash[ * VALID_CONFIG_KEYS.map { |key| [key, send(key)] }.flatten ]
    end

  end # Configuration
end
