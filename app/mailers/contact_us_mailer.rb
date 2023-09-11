class ContactUsMailer < ApplicationMailer
  default from: 'ethicalrescueassociation@gmail.com'
  layout 'mailer'

  def contact_us(name:, email:, message:, city:, region:, region_code:, continent:, lat:, long:, metro_code:, zip:, timezone:, ip:, x_request_id:, x_request_start:, sent_at:)
    @name = name
    @email = email
    @message = message
    @city = city
    @region = region
    @region_code = region_code
    @continent = continent
    @lat = lat
    @long = long
    @metro_code = metro_code
    @zip = zip
    @timezone = timezone
    @ip = ip
    @x_request_id = x_request_id
    @x_request_start = x_request_start
    @sent_at = sent_at
    mail(
      to: ['ethicalrescueassociation@gmail.com', 'mishakrul@gmail.com'],
      from: @email,
      subject: "New inquiry from #{@name} (#{@email})"
    ).deliver
  end
end
