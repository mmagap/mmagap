class Video < ActiveRecord::Base
  
  
  include Paperclip::Glue
  
  attr_accessible :title, :video_link,:file, :category, :tag_list, :views, :user_id, :innappropriate,
  :description, :lesson_upload, :price, :is_active
  
  has_attached_file :lesson_upload

  
  #validates_presence_of :panda_video_id
  validates_presence_of :title
  validates :description, presence: true, length: { in: 1..200 }
  
  validates :price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => { :less_than => 9999999999}
  
  #validates_attachment_presence :lesson_upload
  #validates_attachment_size :lesson_upload, :less_than => 50.megabytes
  #validates_attachment_content_type :lesson_upload, :content_type => ['video/mp4', 'video/avi','video/mpeg', 'video/flv']
  #validates_attachment_content_type :lesson_upload, :content_type => ['video/mp4', 'video/avi','video/mpeg', 'video/flv']
  #validates_attachment_content_type :lesson_upload,
                                    #:content_type => ['video/mp4'],
                                    #:message => "Sorry, right now we only support MP4 video.",
                                    #:if => :is_type_of_video?


  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user
  has_many :plan
  has_many :lesson_checkout
  acts_as_taggable
  is_impressionable
  make_flaggable :inappropriate

  before_create :make_up_to_date

  mount_uploader :attachment, VideoUploader
 
 

  def set_success(format, opts)
    self.success = true
  end

  def processed!
    update_attribute(:processed, true)
  end


  has_reputation :votes, source: :user, aggregated_by: :sum

  scope :needs_feedback, where(:category=> "Needs-Feedback")
  scope :how_to, where(:category=> "How-To")
  scope :demo, where(:category=> "Demo")
  scope :lesson, where(:category=> "Lesson")

  scope :last_x_days, lambda { |x| where("created_at >= :date", :date => (DateTime.now - x.days)) }

  CATEGORIES = %w[Needs-Feedback How-To Demo Lesson]

  def was_vouted_by? user
    self.evaluations.find_by_source_id(user.id)
  end

  def how_was_vouted_by user
    value = self.evaluations.find_by_source_id(user.id)
    if value
      return "positive" if value.value > 0
      return "negative" if value.value < 0
    end
  end

  def category_symbols
    categories.map do |category|
      category.name.underscore.to_sym
    end
  end

  def been_liked_by? user
    res = self.likes.map { |like| like.user_id == user.id ? true : false } 
    res = res[0] if res.kind_of?(Array)
  end

  def have_same_tags_as? obj
    temp = false
    self.tags.each do |outer_tag|
      obj.tags.each do |inner_tag|
        temp = true if outer_tag.name == inner_tag.name
        break if temp
      end
      break if temp
    end
    temp
  end
  
  protected
    def is_type_of_video?
        lesson_upload.content_type =~ %r(video)
    end
    
  
  private
    def make_up_to_date
      self.tags.each {|tag| tag.updated_at = Time.now}
    end
end
