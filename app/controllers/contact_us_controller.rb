require 'geocoder'
require 'recaptcha'
class ContactUsController < ApplicationController
  include Recaptcha::Adapters::ViewMethods
  include Recaptcha::Adapters::ControllerMethods

  def index
  end

  def create
    if current_user && current_user.developer?
      if verify_recaptcha
        redirect_to contact_us_path
      else
        redirect_to root_path
      end
    end

    if params[:name].blank? || params[:email].blank? || params[:message].blank?
      flash[:error] = "Your name, email, and a message are required. Please try again."
      redirect_to contact_us_path
    else
      headers = request.env

      ContactUsMailer.contact_us(
        name: params[:name],
        email: params[:email],
        message: params[:message],
        headers: headers
      ).deliver!

      flash[:notice] = "Thank you for contacting us. We will get back to you shortly."
      render :index
    end
  end

  private

end
