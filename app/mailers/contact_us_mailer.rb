class ContactUsMailer < ApplicationMailer
  default from: 'ethicalrescueassociation@gmail.com'
  layout 'mailer'

  def contact_us(name:, email:, message:)
    @name = name
    @email = email
    @message = message

    mail(
      to: 'ethicalrescueassociation@gmail.com',
      subject: "New email inquiry from #{@name} (#{@email})"
    ).deliver
  end
end
