class CmsPage < ActiveRecord::Base
  
  include Paperclip::Glue
  
  attr_accessible :title, :menu_title, :excerpt, :description, :photo, :is_active, :photo_file_name, :photo_content_type, :photo_file_size
  
  #attr_accessible :photo_attributes
  #accepts_nested_attributes_for :photo, :allow_destroy => true
  
  #has_attached_file :photo, :styles => { :medium => "238x238>", :thumb => "100x100>"}
  has_attached_file :photo
  
  #has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  
  #has_attached_file :img_avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  #has_attached_file :file_avatar, :default_url => "/files/:style/missing.doc"
  
  
  
  # rails
  validates :title, :presence => true
  validates :menu_title, :presence => true
  validates :excerpt, :presence => true, :length => { :maximum => 150 }
  validates :description, :presence => true
  #validates :is_active, :presence => true
  
  #validates_attachment :photo, :presence => true,
    #:content_type => { :content_type => "image/jpg"},
    #:size => { :in => 50..10.mb }*/
    
  #validates_attachment :photo, content_type: { content_type: "image/jpg" }
      
  #validates_with AttachmentPresenceValidator, :attributes => :photo
  
end

