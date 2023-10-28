class ApplicationFunnelController < ApplicationController


  def index
    redirect_to root_url unless current_user && current_user.developer?
  end

  def show
    redirect_to root_url unless current_user && current_user.developer?

    Rails.logger.info "\n\n\nPOTATO:\n\n\n"
    Rails.logger.info request.params
    Rails.logger.info request
  end

end
