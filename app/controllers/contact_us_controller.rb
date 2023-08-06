class ContactUsController < ApplicationController

  def index
  end

  def create
    if contact_params[:name].blank? || contact_params[:email].blank? || contact_params[:message].blank?
      flash[:error] = "Your name, email, and a message are required. Please try again."
    else
      flash[:notice] = "Thank you for contacting us. We will get back to you shortly."
    end

    redirect_to contact_us_path
  end

  private

  def contact_params
    params.permit(:name, :email, :message)
  end

end
