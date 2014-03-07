ActiveAdmin.register CmsPage do
  
  # Filter only by title
  filter :title
  filter :menu_title
  filter :is_active
  filter :created_at
  filter :updated_at
  
  
  index do
    id_column
    column :title
    column :menu_title
    column :excerpt
    
    column "Image" do |cms_page|
      link_to(image_tag(cms_page.photo, :height => '100'), admin_cms_page_path(cms_page))
      #link_to image_tag(cms_page.photo.url(:thumb), :alt => "post image"), admin_cms_page_path(cms_page)
      #image_tag("/".cms_page.photo.url)
    end
    column :is_active
    column :created_at
    column :updated_at
    default_actions
  end
  
  
  
  #filter :title, menu_title
  
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs 'New Cms Page', :multipart => true do
      f.input :title
      f.input :menu_title
      f.input :excerpt, :input_html =>{:class => "sort_desc", :class => 'autogrow', :rows => 5, :cols => 20}
      f.input :description, :label=>true, :input_html => { :class => "ckeditor", :id => "description"}
      f.input :photo, :as => "file", :hint => f.template.image_tag(f.object.photo, :height=>'100')
      f.input :is_active
    end
    f.buttons
  end
  
  #def create
    #@cms_page = CmsPage.create( params[:cms_page] )
  #end

  
end
