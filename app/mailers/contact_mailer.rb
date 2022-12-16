class ContactMailer < ApplicationMailer

  def contact_mail(contact, user)
    @contact = contact
    mail to: user.email, bcc: ENV["ACTION_MAILER_USER"], subject: "製作アプリについてのお問い合わせ【自動送信】"
  end
end

