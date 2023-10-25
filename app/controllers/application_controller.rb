require 'dotenv/load'
class ApplicationController < ActionController::Base
  add_flash_types :info, :alert, :error, :success
  include ApplicationHelper
  before_action :redirect_to_google

  COUNTRY_BLACKLIST = [
    "MD",
    "NL",
    "RU",
    "UA",
    "PL"
  ]

  def redirect_to_google
    headers = request.env

    redirect_to "https://www.google.com" if COUNTRY_BLACKLIST.include?(headers['HTTP_CF_IPCOUNTRY'])
  end
end
