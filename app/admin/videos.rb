ActiveAdmin.register Video do
 
  
  filter :title
  filter :category
  filter :created_at
  filter :updated_at
  
  index do
    id_column
    column :title
    column :category
    
    column "Video" do |videolink|
	  if !videolink.video_link.nil?
		
	     #video_tag('http//www.youtube.com/embed/CGyAaR2aWcA',:controls=>true,:autobuffer=>true,:size=>"320X249", :id=>videolink.id)
	     youtubeplayer(videolink.video_link, 'youtube').html_safe
	  elsif !videolink.lesson_upload.nil?
	     
	     youtubeplayer(videolink.lesson_upload, 'lesson').html_safe
	     #video_tag(videolink.lesson_upload,:controls=>true,:autobuffer=>true,:size=>"320X249")
	     #jwplayer({file:videolink.lesson_upload})
	     #jwplayer({file:videolink.lesson_upload})
	  else
		    
	  end	    
		    
	  #column :video_link
    end
    
    
    
    #column :lesson_upload
   
    column :is_active
    column :created_at
    default_actions
  end
  
  
  show do |video|
      attributes_table do
        row :title
        row :created_at
        row :updated_at
        row :description
        row :tags
        row :category
        row :price
        row :is_active
        row :video do
          if !video.video_link.nil?
	     youtubeplayer(video.video_link, 'youtube').html_safe
	  elsif !video.lesson_upload.nil?
	     youtubeplayer(video.lesson_upload, 'lesson').html_safe
	  else
	  end	    
        end
      end
      #active_admin_comments
   end
  
  
end
