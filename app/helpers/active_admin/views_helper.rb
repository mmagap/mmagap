module ActiveAdmin::ViewsHelper #camelized file name
  # define helper methods here ...
  def youtubeplayer(youtube_url, vtype) 
    
    if (vtype == 'youtube')
      @youtube_video_id = (/([\w-]{11})/.match(youtube_url)).to_s
      @youtube_video_code =  %Q{<iframe title="YouTube video player" style=" margin-top: 24px;" width="400px" height="249px" src="http://www.youtube.com/embed/#{ @youtube_video_id}" frameborder="0" allowfullscreen></iframe>}
    
    else
       
       #@f_video_code =  %Q{<div class="flowplayer"  data-ratio="0.4167" style="width:320px;height:210px;"><video><source type="video/mp4" src="#{youtube_url}"></video></div>}
       #@f_video_code =  %Q{<div class="flowplayer"  data-ratio="0.4167" style="width:320px;height:210px;"><video><source type="video/mp4" src="#{youtube_url}"></video></div>}
       

        v =
            <<-EOHTML
              <div id="myElement">Loading the player...</div>
              <script type="text/javascript">
                jwplayer("myElement").setup({
                    flashplayer: '/assets/jwplayer.flash.swf"',
                    file: "#{youtube_url}"
                    base:'/assets/',
                });
              </script>
            EOHTML
       
    end
    #if (vtype == 'youtube')
    #  
    #  @youtube_video_id = (/([\w-]{11})/.match(youtube_url)).to_s
    #  v =
    #      <<-EOHTML
    #         <iframe title="YouTube video player" style=" margin-top: 24px;" width="400px" height="249px" src="http://www.youtube.com/embed/#{ @youtube_video_id}" frameborder="0" allowfullscreen></iframe>
    #      EOHTML
    #else
    #  
    #  v =
    #      <<-EOHTML
    #         <div class="flowplayer"  data-ratio="0.4167" style="width:320px;height:210px;"><video><source type="video/mp4" src=""></video></div>
    #      EOHTML
    #    
    #end  
    #
    #s.html_safe
  
    
  
  end
  
  
end 