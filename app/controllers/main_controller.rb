require 'dogapi'

class MainController < ApplicationController
  include MainHelper

  def index
    api_key = Rails.application.credentials.datadog[:dd_api_key]
    client = Dogapi::Client.new(api_key)
    client.emit_point('test.metric', 100)
  end

  def home
  end

end
