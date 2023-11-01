class ApplicationSubmissionMailer < ApplicationMailer
  default from: 'ethicalrescueassociation@gmail.com'
  layout 'mailer'
  ERA_EMAIL = "ethicalrescueassociation@gmail.com"

  def send_confirmation(email, form_url)
    @email = email
    @form_url = form_url

    mail(
      to: @email,
      from: ERA_EMAIL,
      reply_to: ERA_EMAIL,
      subject: "Steps for completing your ERA membership application"
    ).deliver
  end

end
