class DonationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    redirect_to root_url unless current_user && current_user.developer?
  end

  def show

  end

  def create
    # redirect_to root_url unless current_user && current_user.developer?
  end

  private

  def donation_params
    params.require(:donation).permit(:donation)
  end

end
