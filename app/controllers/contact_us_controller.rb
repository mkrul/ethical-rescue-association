require 'geocoder'
require 'date'
class ContactUsController < ApplicationController

  def index
  end

  def create
    if params[:name].blank? || params[:email].blank? || params[:message].blank?
      flash[:error] = "Your name, email, and a message are required. Please try again."
      redirect_to contact_us_path
    else
      time = request.env['HTTP_X_REQUEST_START']
      sent_at = time.present? ? Time.at(request.env['HTTP_X_REQUEST_START']).to_datetime : nil

      ContactUsMailer.contact_us(
        name: params[:name],
        email: params[:email],
        message: params[:message],
        city: request.env['HTTP_CF_IPCITY'],
        region: request.env['HTTP_CF_REGION'],
        region_code: request.env['HTTP_CF_REGION_CODE'],
        continent: request.env['HTTP_CF_IPCONTINENT'],
        lat: request.env['HTTP_CF_IPLATITUDE'],
        long: request.env['HTTP_CF_IPLONGITUDE'],
        metro_code: request.env['HTTP_CF_METRO_CODE'],
        zip: request.env['HTTP_CF_POSTAL_CODE'],
        timezone: request.env['HTTP_CF_TIMEZONE'],
        ip: request.env['HTTP_CF_CONNECTING_IP'],
        x_request_id: request.env['HTTP_X_REQUEST_ID'],
        x_request_start: request.env['HTTP_X_REQUEST_START'],
        sent_at: sent_at
      ).deliver!

      flash[:notice] = "Thank you for contacting us. We will get back to you shortly."
      render :index
    end
  end

  private

end
