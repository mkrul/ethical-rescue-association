class UserMailer < ApplicationMailer
  default from: 'ethicalrescueassociation@gmail.com'
  layout 'mailer'

  def contact_us(name:, email:, message:)
    @name = name
    @email = email
    @message = message
    mail(
      to: 'ethicalrescueassociation@gmail.com',
      subject: "New email inquiry from #{@name} (#{@email})",
      template_name: 'contact_us',
      template_path: 'mailers/contact_us',
    )
  end
end
