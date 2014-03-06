class RequestMailer < ActionMailer::Base
  def request_confirmation(request)
    @other="lol"
   	@user=request.user.username
    mail(:to => request.user.email, :subject => "You have been requested", :from => "no-reply@mmagap.com")
  end
end
