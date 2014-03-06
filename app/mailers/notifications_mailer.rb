class NotificationsMailer < ActionMailer::Base
  default :from => "vertaxweb@gmail.com"
  default :to => "vertaxweb@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[vertaxweb@gmail.com] #{message.subject}")
  end
end
