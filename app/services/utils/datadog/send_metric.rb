require 'rubygems'
require 'dogapi'

module Utils
  module Datadog
    class SendMetric < ActiveInteraction::Base
      string :metric
      integer :value

      def execute
        client.emit_point(metric, value)
      end

      private

      def api_key
        Rails.application.credentials[Rails.env.to_sym][:datadog][:dd_app_key]
      end

      def client
        api_key.nil? ? nil : Dogapi::Client.new(api_key)
      end

    end
  end
end
