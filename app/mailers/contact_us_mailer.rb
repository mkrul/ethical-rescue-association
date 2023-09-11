class ContactUsMailer < ApplicationMailer
  default from: 'ethicalrescueassociation@gmail.com'
  layout 'mailer'

  def contact_us(name:, email:, message:, headers:)
    @name = name
    @email = email
    @message = message
    @headers = headers
    mail(
      to: ['ethicalrescueassociation@gmail.com', 'mishakrul@gmail.com'],
      from: @email,
      subject: "New inquiry from #{@name} (#{@email})"
    ).deliver
  end
end
