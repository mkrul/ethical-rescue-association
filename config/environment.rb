# Load the Rails application.
require_relative "application"
require File.expand_path('../application', __FILE__)
require File.expand_path('../rollbar', __FILE__)

Rails.application.initialize!
