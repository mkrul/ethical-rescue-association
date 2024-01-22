require 'rubygems'
require 'dogapi'

module Datadog
  class Client
    attr_accessor :metric, :value

    def self.create_instance()
      Dogapi::Client.new()
    end

    def initialize
      api_key = Rails.application.credentials[Rails.env.to_sym][:datadog][:dd_app_key]
      @metric = metric
      @value = value
      @client = api_key.nil? ? nil : Dogapi::Client.new(api_key)
    end

    def send_metric
      @client.emit_point(@metric, @value)
    end

  end
end
