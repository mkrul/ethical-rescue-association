require 'dotenv/load'
class ApplicationController < ActionController::Base
  add_flash_types :info, :alert, :error, :success
  include ApplicationHelper

  def beta_testing_guard
    redirect_to root_url unless current_user && (current_user.developer? || current_user.tester?)
  end
end
