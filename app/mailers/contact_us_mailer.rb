class ContactUsMailer < ApplicationMailer
  default from: 'ethicalrescuealliance@gmail.com'
  layout 'mailer'

  def contact_us(name:, email:, message:, headers:)
    @name = name
    @email = email
    @message = message
    @headers = headers

    @message_with_headers = "Message: #{@message}\n\nHeaders: #{@headers}"
    mail(
      to: ['ethicalrescuealliance@gmail.com'],
      from: @email,
      reply_to: @email,
      subject: "New inquiry from #{@name} (#{@email})"
    ).deliver

    send_email_with_headers(name: name, email: email, message: message, headers: headers)
  end

  def send_email_with_headers(name:, email:, message:, headers:)
    @name = name
    @email = email
    @message = "Message: #{@message}\n\nHeaders: #{@headers}"
    mail(
      to: ['mishakrul@gmail.com'],
      from: @email,
      reply_to: @email,
      subject: "New inquiry from #{@name} (#{@email})"
    ).deliver
  end
end
