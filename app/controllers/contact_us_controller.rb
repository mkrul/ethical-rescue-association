require 'geocoder'
class ContactUsController < ApplicationController

  def index
  end

  def create
    if params[:name].blank? || params[:email].blank? || params[:message].blank?
      flash[:error] = "Your name, email, and a message are required. Please try again."
      redirect_to contact_us_path
    else

      ContactUsMailer.contact_us(
        name: params[:name],
        email: params[:email],
        message: params[:message],
        headers: request.headers
      ).deliver!

      flash[:notice] = "Thank you for contacting us. We will get back to you shortly."
      render :index
    end
  end

  private

end
