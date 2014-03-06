class VideoMailer < ActionMailer::Base
  def video_confirmation(video)
   	@user=video.user.username
    mail(:to => video.user.email, :subject => "Video Succesfully Posted", :from => "no-reply@mmagap.com")
  end
end
