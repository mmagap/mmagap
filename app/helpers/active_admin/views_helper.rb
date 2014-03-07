module ActiveAdmin::ViewsHelper #camelized file name
  def my_helper(youtube_url); 
      #@video_id = (/([\w-]{11})/.match(@video.video_link)).to_s
      #@embed_code =  %Q{<iframe title="YouTube video player" style=" margin-top: 24px;" width="640" height="390" src="http://www.youtube.com/embed/#{ @video_id}" frameborder="0" allowfullscreen></iframe>}
      @youtube_video_id = (/([\w-]{11})/.match(youtube_url)).to_s
      @youtube_video_code =  %Q{<iframe title="YouTube video player" style=" margin-top: 24px;" width="400px" height="249px" src="http://www.youtube.com/embed/#{ @youtube_video_id}" frameborder="0" allowfullscreen></iframe>}
      
  end 
end