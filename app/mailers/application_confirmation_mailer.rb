class ApplicationConfirmationMailer < ApplicationMailer
  default from: "ethicalrescueassociation@gmail.com"
  layout 'mailer'

  def confirmation(email:, form_url:)
    @email = email
    @form_url = form_url

    mail(
      to: [@email],
      from: "ethicalrescueassociation@gmail.com",
      reply_to: "ethicalrescueassociation@gmail.com",
      subject: "Complete your ERA membership application"
    ).deliver
  end

end
