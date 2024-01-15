class ApplicationConfirmationMailer < ApplicationMailer
  default from: "ethicalrescuealliance@gmail.com"
  layout 'mailer'

  def confirmation(email:, form_url:)
    @email = email
    @form_url = form_url

    mail(
      to: [@email],
      from: "ethicalrescuealliance@gmail.com",
      reply_to: "ethicalrescuealliance@gmail.com",
      subject: "Complete your ERA membership application"
    ).deliver
  end

end
