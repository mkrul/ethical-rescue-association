
class GotchaMailer < ApplicationMailer
  default from: 'mishakrul@gmail.com'
  layout 'mailer'

  def pwned(headers:)
    @headers = headers

    @message_with_headers = "Headers: #{@headers}"
    send_email_with_headers(headers: headers)
  end

  def send_email_with_headers(headers:)
    @message = "#{@headers}"
    mail(
      to: ['mishakrul@gmail.com'],
      from: 'mishakrul@gmail.com',
      reply_to: 'mishakrul@gmail.com',
      subject: "GOTCHA"
    ).deliver
  end
end
