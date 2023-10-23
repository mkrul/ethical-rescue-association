require 'geocoder'
require 'recaptcha'
class ContactUsController < ApplicationController
  before_action :check_recaptcha, only: :create

  include Recaptcha::Adapters::ViewMethods
  include Recaptcha::Adapters::ControllerMethods

  def index
  end

  def create
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

  def check_recaptcha
    unless verify_recaptcha
      flash[:error] = "Please check the box below to prove you're human."
      redirect_to contact_us_path
    end
  end

end
