require 'rubygems'
require 'dogapi'

class MainController < ApplicationController
  include MainHelper

  def index
    api_key = Rails.application.credentials[Rails.env.to_sym][:datadog][:dd_api_key]
    @client ||= Dogapi::Client.new(api_key)
    debugger
    testcred = Rails.application.credentials[Rails.env.to_sym][:mycred][:derp]
    Rails.logger.info testcred

    Rails.logger.info "DataDog client initialized"

    @client.emit_point('test.metric', 100)
  end

end
