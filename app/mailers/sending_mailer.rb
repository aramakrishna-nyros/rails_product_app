class SendingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  # en.sending_mailer.new_mail.subject
  
  def new_mail(data)
   @products = data
   puts "++++++++++++++++++++++++++++++++++++++++++++++++++#{@products.to_a}"
    mail(:to => "rk.ramakrishna11@gmail.com", :subject => "sending successfully")
        
  end

end











  # require 'net/smtp'
    # msg = "Subject: Hi namaskaram ra babu. Ruby"
   #  smtp = Net::SMTP.new 'smtp.gmail.com', 587
   #  smtp.enable_starttls
   #  smtp.start('ruby', 'rk.ramakrishna11@gmail.com', 'Ram@123_456', :login) do
   #  smtp.send_message(msg, 'rk.ramakrishna11@gmail.com', 'rk.ramakrishna11@gmail.com')
# m = SendingMailer. new
# m.new_mail
#  