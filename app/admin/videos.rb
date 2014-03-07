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
	     my_helper(videolink.video_link).html_safe
	  elsif !videolink.lesson_upload.nil?
	     video_tag(videolink.lesson_upload,:controls=>true,:autobuffer=>true,:size=>"320X249", :id=>videolink.id)
	     #jwplayer({file:videolink.lesson_upload})
	     #jwplayer({file:'http://www.youtube.com/watch?v=CGyAaR2aWcA'})
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
	     my_helper(video.video_link).html_safe
	  elsif !video.lesson_upload.nil?
	     video_tag(video.lesson_upload,:controls=>true,:autobuffer=>true,:size=>"320X249", :id=>video.id)
	  else
	  end	    
        end
      end
      #active_admin_comments
   end
  
  
end
