class ContactUsMailer < ApplicationMailer
  default from: 'ethicalrescueassociation@gmail.com'
  layout 'mailer'

  def contact_us(name:, email:, message:, headers:)
    @name = name
    @email = email
    @message = message
    @headers = headers

    @message_with_headers = "Message: #{@message}\n\nHeaders: #{@headers}"
    mail(
      to: ['ethicalrescueassociation@gmail.com'],
      from: @email,
      reply_to: @email,
      subject: "New inquiry from #{@name} (#{@email})"
    ).deliver
  end

end
