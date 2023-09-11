require 'geocoder'
class ContactUsController < ApplicationController

  def index
  end

  def create
    if params[:name].blank? || params[:email].blank? || params[:message].blank?
      flash[:error] = "Your name, email, and a message are required. Please try again."
      redirect_to contact_us_path
    else
      remote_ip = request.remote_ip
      x_forwarded_for = request.env["HTTP_X_FORWARDED_FOR"]

      begin
        remote_ip_results = Geocoder.search(remote_ip)
        x_forwarded_for_results = Geocoder.search(x_forwarded_for)
        remote_lat = remote_ip_results&.first&.coordinates&.first
        remote_long = remote_ip_results&.first&.coordinates&.second

        x_lat = x_forwarded_for_results&.first&.coordinates&.first
        x_long = x_forwarded_for_results&.first&.coordinates&.second

        remote_geo_localization = "#{remote_lat},#{remote_long}"
        x_geo_localization = "#{x_lat},#{x_long}"

        remote_query = Geocoder.search(remote_geo_localization)&.first
        remote_address = remote_query&.address

        x_query = Geocoder.search(x_geo_localization)&.first
        x_address = x_query&.address

        ContactUsMailer.contact_us(
          name: params[:name],
          email: params[:email],
          message: params[:message],
          remote_ip: request.remote_ip,
          x_forwarded_for: request.env["HTTP_X_FORWARDED_FOR"],
          remote_geo_localization: remote_geo_localization,
          x_geo_localization: x_geo_localization,
          remote_address: remote_address,
          x_address: x_address
        ).deliver!
      rescue => e
        Rails.logger.info "MAIL ERROR: #{e.message}"
        Rails.logger.info "BACKTRACE: #{e.backtrace}"
        ContactUsMailer.contact_us(
          name: params[:name],
          email: params[:email],
          message: params[:message],
          remote_ip: request.remote_ip,
          x_forwarded_for: request.env["HTTP_X_FORWARDED_FOR"]
        ).deliver!
      end

      flash[:notice] = "Thank you for contacting us. We will get back to you shortly."
      render :index
    end
  end

  private

end
