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
		
		#video_tag(videolink.video_link,:controls=>true,:autobuffer=>true,:size=>"320X249")
	  elsif !videolink.lesson_upload.nil?
	     #video_tag(videolink.lesson_upload,:controls=>true,:autobuffer=>true,:size=>"320X249")
	     jwplayer({file:videolink.lesson_upload})
	  else
		    
	  end	    
		    
	  #column :video_link
    end
    
    
    
    #column :lesson_upload
   
    column :is_active
    column :created_at
    default_actions
  end
  
  
end
