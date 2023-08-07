class UserMailer < ApplicationMailer
  default from: 'ethicalrescueassociation@gmail.com'
  layout "mailer"

  def mailer(user)
    @name = 'derp'
    @email = 'derp@derp.com'
    @message = 'herp derp'
    mail(
      to: 'ethicalrescueassociation@gmail.com',
      subject: "New email inquiry from #{@name} (#{@email})",
      body: @message
    )
  end
end
