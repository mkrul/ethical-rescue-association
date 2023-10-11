require 'geocoder'
class ContactUsController < ApplicationController
  BLACKLISTED_TIMEZONES = %w(Europe/Kyiv Europe/Chisinau Asia/Yekaterinburg Asia/Novosibirsk Asia/Krasnoyarsk Asia/Irkutsk Asia/Yakutsk Asia/Vladivostok Asia/Sakhalin Asia/Magadan Asia/Kamchatka Asia/Anadyr)

  def index
  end

  def create
    if params[:name].blank? || params[:email].blank? || params[:message].blank?
      flash[:error] = "Your name, email, and a message are required. Please try again."
      redirect_to contact_us_path
    else
      headers = request.env

      if BLACKLISTED_TIMEZONES.include?(headers["HTTP_CF_TIMEZONE"])
        redirect_to "https://www.youtube.com/watch?v=dQw4w9WgXcQ", allow_other_host: true
      else
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
  end

  private

end
