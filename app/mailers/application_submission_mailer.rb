class ApplicationSubmissionMailer < ApplicationMailer
  default from: 'ethicalrescueassociation@gmail.com'
  layout 'mailer'
  ERA_EMAIL = "ethicalrescueassociation@gmail.com"

  def confirmation(user, submission)
    @user = user
    @submission = submission

    mail(
      to: @user.email,
      from: ERA_EMAIL,
      reply_to: ERA_EMAIL,
      subject: "Steps for completing your ERA membership application"
    ).deliver
  end

end
