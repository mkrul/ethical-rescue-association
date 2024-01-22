require 'rubygems'
require 'dogapi'

module Utils
  class DataDog < ActiveInteraction::Base
    string :metric
    integer :value

    def execute
      @client.emit_point(metric, value)
    end

    private

    def client
      @client ||= Dogapi::Client.new(api_key)
    end

    def api_key
      Rails.application.credentials[Rails.env.to_sym][:datadog][:dd_app_key]
    end
  end
end
