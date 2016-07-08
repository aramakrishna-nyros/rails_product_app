# Preview all emails at http://localhost:3000/rails/mailers/sending_mailer
class SendingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sending_mailer/new_mail
  def new_mail
    SendingMailer.new_mail
  end

end
