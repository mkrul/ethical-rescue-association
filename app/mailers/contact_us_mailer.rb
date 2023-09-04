class ContactUsMailer < ApplicationMailer
  default from: 'ethicalrescueassociation@gmail.com'
  layout 'mailer'

  def contact_us(name:, email:, message:)
    @name = name
    @email = email
    @message = message

    mail(
      to: 'ethicalrescueassociation@gmail.com',
      from: @email,
      subject: "New inquiry from #{@name} (#{@email})"
    ).deliver
  end
end
