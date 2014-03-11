ActiveAdmin.register Video do
 
  
  filter :title
  #filter :tag_taggings_tag_name, :label => "Tags", :as => :check_boxes, :collection => proc { ActsAsTaggableOn::Tag.all.map{|t| [t.name, t.name]} }
  filter :tag_taggings_tag_name, :label => "Tags", :as => :select, :collection => proc { ActsAsTaggableOn::Tag.all.map{|t| [t.name, t.name]} }, :multiple => true
  filter :category, :as => :select, :collection => { 'Demo' => 'Demo', 'How To' => 'How-to', 'Needs Feedback'=>'Needs-Feedback', "Lesson"=>'Lesson'}
  filter :created_at
  filter :updated_at
  
  index do |video|
	  id_column
	  column :title
	  column :category
          
          
          
	  #  column "Video" do |videolink|
	  #	    if !videolink.video_link.nil?
	  #		  
	  #	       #video_tag('http//www.youtube.com/embed/CGyAaR2aWcA',:controls=>true,:autobuffer=>true,:size=>"320X249", :id=>videolink.id)
	  #	       youtubeplayer(videolink.video_link, 'youtube').html_safe
	  #	    else
	  #				      
	  #	    end	    
	  #		  
	  #	    #column :video_link
	  #  end
	  #   
	  #  column "Lesson Upload" do |lessonupload|
	  #	    if !lessonupload.lesson_upload.nil?
	  #	   
	  #		      youtubeplayer(lessonupload.lesson_upload, 'lesson').html_safe
	  #		      #video_tag(videolink.lesson_upload,:controls=>true,:autobuffer=>true,:size=>"320X249")
	  #		      #jwplayer({file:videolink.lesson_upload})
	  #		      #jwplayer({file:videolink.lesson_upload})
	  #	    else
	  #		  
	  #	    end	    
	  #		  
	  #	#column :video_link
	  #  end
	#   
    
    
	  #column :lesson_upload
   
	  column :is_active
	  column :created_at
	  default_actions
  end
  
  
  form do |f|
    f.inputs '' do
	  f.input :user_id,  :as => :select, :collection => User.order(:username), :include_blank => true
	  f.input :title
	  f.input :category, :as => :select, :collection => { 'Demo' => 'Demo', 'How To' => 'How-to', 'Needs Feedback'=>'Needs-Feedback', "Lesson"=>'Lesson'}, :include_blank => true, :input_html => { :onchange => "changeFrom(this.value)" }
	  f.input :video_link
	  f.input :description, :label=>true, :input_html => { :class => "", :id => "descripcion"}
	  f.input :tags,  :as => :select, :collection => Tag.order(:name), :include_blank => false, :multiple => true
	  #f.input :tags, :as => :select, :collection => proc { ActsAsTaggableOn::Tag.all.map{|t| [t.name, t.name]} }, :include_blank => false, :multiple => true
	  #f.input :tag_taggings_tag_name, :label => "Tags", :as => :select, :collection => proc { ActsAsTaggableOn::Tag.all.map{|t| [t.name, t.name]} }, :multiple => true
          f.input :lesson_upload, :as => "file"
          f.input :price, :as=> :string, :value=>'0.00',:input_html => {:value=>'0.00'}
          f.input :is_active
    end
    f.buttons
  end
  #form do |f|
  #  f.inputs 'Add New User' do
  #    f.input :name
  #    #f.input :group_id, :as => :select, :collection => { 'Manager' => 2, 'Guest' => 3}
  #    f.input :email
  #    f.input :password
  #    f.input :password_confirmation
  #    f.input :address, :input_html => { :class => "", :id => "address"}
  #    f.input :city, :as=> :string
  #    f.input :zip, :as=> :string
  #    f.input :city, :as=> :string
  #    f.input :state, :as=> :string
  #    f.input :country, :as=> :string
  #    f.input :latitude, :as=> :string
  #    f.input :longitude, :as=> :string
  #    f.input :image, :as => "file", :hint => f.template.image_tag(f.object.image, :height=>'100')
  #    #f.input :is_active
  #    
  #  end
  #  f.buttons
  #end
  
  
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
        row :video_link
        row :lesson_upload
        
        row :video do
	   	  
          if !video.video_link.empty?
	     video.video_link 	    
	     youtubeplayer(video.video_link, 'youtube').html_safe
	  elsif !video.lesson_upload.empty?
		    video.lesson_upload
	     myvideo(video.lesson_upload).html_safe
	  else
		    
	  end	    
        end
      end
      #active_admin_comments
   end
  
  
end
