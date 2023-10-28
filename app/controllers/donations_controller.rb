class DonationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    beta_testing_guard
  end

  def show

  end

  def create
    beta_testing_guard

    @donation = Donation.new(donation_params)
  end

  private

  def donation_params
    params.require(:donation).permit(:donation)
  end

end
