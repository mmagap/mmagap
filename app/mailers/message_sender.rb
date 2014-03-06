class MessageSender < ActionMailer::Base
  def send_message message, user_from, user_to
    @message = message
    @user_from = user_from
    @user_to = user_to
    mail(:to => user_from.email, :template_name => "i_send").deliver
    mail(:to => user_to.email, :template_name => "i_receive").deliver
  end
end
