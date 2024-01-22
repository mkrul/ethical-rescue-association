require 'rubygems'
require 'dogapi'

class MainController < ApplicationController
  include MainHelper

  def index
    api_key = Rails.application.credentials[Rails.env.to_sym][:datadog][:dd_app_key]
    @client ||= Dogapi::Client.new(api_key)

    Rails.logger.info "DataDog client initialized"

    @client.emit_point('test.metric', 100)
  end

end
