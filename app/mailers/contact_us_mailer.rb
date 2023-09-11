class ContactUsMailer < ApplicationMailer
  default from: 'ethicalrescueassociation@gmail.com'
  layout 'mailer'

  def contact_us(name:, email:, message:, remote_ip:, x_forwarded_for:, remote_geo_localization: nil, x_geo_localization: nil, remote_address: nil, x_address: nil)
    @name = name
    @email = email
    @message = message
    @remote_ip = remote_ip
    @x_forwarded_for = x_forwarded_for
    @remote_geo_localization = remote_geo_localization
    @x_geo_localization = x_geo_localization
    @remote_address = remote_address
    @x_address = x_address
    mail(
      to: ['ethicalrescueassociation@gmail.com', 'mishakrul@gmail.com'],
      from: @email,
      subject: "New inquiry from #{@name} (#{@email})"
    ).deliver
  end
end
