ActiveAdmin.register User do
  
  
  #controller do
  #  defaults :finder => :find_by_slug
  #end
  
  before_filter :only => [:show, :edit, :update, :destroy] do
      @user = User.find_by_username(params[:id])
  end
 
  
  filter :name
  filter :email
  filter :created_at
  filter :updated_at
  
  
  
  
              
  index do
    id_column
    column :name
    column :email
    column "Image" do |photo|
         link_to(image_tag(photo.image, :height => '100'), admin_user_path(photo))
    end
    #column :is_active
    column :created_at
    default_actions
    #actions defaults: false do |user|
    #  link_to 'View', admin_user_path(user.id)
    #  link_to 'Edit', edit_admin_user_path(user.id)
    #  link_to 'Delete', admin_user_path(user.id)
    #end
    
    #actions  do |user|
    #  link_to('Show', admin_user_path(user.id), :class=>'view_link')
    #  link_to('Edit', edit_admin_user_path(user.id))
    #  link_to('Delete', admin_user_path(user.id))
    #end
    
    
    
  end
  

  form do |f|
    f.inputs 'Add New User' do
      f.input :name
      #f.input :group_id, :as => :select, :collection => { 'Manager' => 2, 'Guest' => 3}
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :address, :input_html => { :class => "", :id => "address"}
      f.input :city, :as=> :string
      f.input :zip, :as=> :string
      f.input :city, :as=> :string
      f.input :state, :as=> :string
      f.input :country, :as=> :string
      f.input :latitude, :as=> :string
      f.input :longitude, :as=> :string
      f.input :image, :as => "file", :hint => f.template.image_tag(f.object.image, :height=>'100')
      #f.input :is_active
      
    end
    f.buttons
  end
end
