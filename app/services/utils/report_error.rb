require 'rollbar'

module Utils
  class ReportError < ActiveInteraction::Base
    string :error
    hash :context, strip: false
    string :level, default: 'error'

    def execute
      Rails.logger.error("#{level.upcase} in #{controller}##{action}: ")
      Rails.logger.error("MESSAGE: #{error}")
      Rails.logger.error("CONTEXT: #{context}")

      if Rails.env.production?
        begin
          Rollbar.with_config(use_async: false) do
            Rollbar.error(error, context, level: level)
          end
        rescue
          Rails.logger.error "Synchronous Rollbar notification failed.  Sending async to preserve info"
          Rollbar.error(error, context)
        end
      end
    end

    private



    def controller
      context.dig(:controller)
    end

    def action
      context.dig(:action)
    end

  end
end