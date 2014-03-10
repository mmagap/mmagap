ActiveAdmin.register Inquiry  do
  
  filter :name
  filter :email
  filter :subject
  filter :created_at
  filter :updated_at
  
  index do
    id_column
    column :name
    column :subject
    column :email
    column :created_at
    default_actions
   
    
  end
  form do |f|                         
    f.inputs "" do
      f.input :name    
      f.input :email                  
      f.input :subject               
      f.input :message, :label=>true, :input_html => { :class => "ckeditor", :id => "descripcion"}
    end                               
    f.actions                         
  end        
  
end