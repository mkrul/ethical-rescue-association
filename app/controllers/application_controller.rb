require 'dotenv/load'
class ApplicationController < ActionController::Base
  add_flash_types :info, :alert, :error, :success
  include ApplicationHelper
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def beta_testing_guard
    redirect_to root_url unless current_user && (current_user.developer? || current_user.tester?)
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_url)
  end

end
