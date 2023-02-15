class ContactMailer < ApplicationMailer
  def contact_mail(contact, email)
    @contact = contact
    mail to: email, bcc: Rails.application.credentials.google[:mail], subject: "お問い合わせについて【自動送信】"
  end
end
