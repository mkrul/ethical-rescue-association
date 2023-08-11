class ContactUsController < ApplicationController

  def index
  end

  def create
    if params[:name].blank? || params[:email].blank? || params[:message].blank?
      flash[:error] = "Your name, email, and a message are required. Please try again."
    else
      ContactUsMailer.contact_us(
        name: params[:name],
        email: params[:email],
        message: params[:message]
      ).deliver!

      flash[:notice] = "Thank you for contacting us. We will get back to you shortly."
    end

    redirect_to contact_us_path
  end

  private

end
