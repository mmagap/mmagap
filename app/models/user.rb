class User < ActiveRecord::Base
  
  make_flagger
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable



  # Setup accessible (or protected) attributes for your model
  attr_accessible :id, :email, :password, :password_confirmation,:videos, :remember_me, :username, :image,
  :membership, :facebookimage, :address, :city, :state, :zip, :country

  acts_as_messageable
 
  mount_uploader :image, ImageUploader
  mount_uploader :facebookimage, ImageUploader

  geocoded_by :full_address
  after_validation :geocode

  reverse_geocoded_by :latitude, :longitude, :location => :address
  after_validation :reverse_geocode

  after_create :add_s_t_profile
  before_create :change_user_name

  has_many :videos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :requests
  has_many :likes, dependent: :destroy
  has_many :relationships, foreign_key: 'follower_id', dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower 
  has_one :student_teacher_profile, dependent: :destroy
  has_many :lesson_checkout
  
  validates :username,     uniqueness: true
  validates :username,     presence: true
  validates :country,      presence: true
  validates :city, :state, length: { maximum: 50 }
  validates :address,      length: { maximum: 100}

  MEMBERSHIPS = %w[Teacher Student]

  #for users/username navigation. this will work only if we have username, uniqueness: true
  def to_param
    username
  end


  def full_address
    [address, city, state].compact.join(', ')
  end

  def a_points
    self.comments.count + self.videos.count
  end

  def pro_points
    self.videos.map{|x| x.reputation_for(:votes).to_i}.sum
  end

  def memberships_symbols
    memberships.map do |membership|
      membership.name.underscore.to_sym
    end
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end    
  end

  def password_required?
    super && provider.blank?
  end

  def confirmation_required?
    super && email.present?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
         
  def name
    email
  end

  def this_video_like id 
    self.likes.map {|like| return like if like.video_id == id }
    like = like[0] if like.kind_of?(Array)
  end

  def following? other_user
    relationships.find_by_followed_id(other_user.id)
  end

  def follow! other_user
    relationships.create! followed_id: other_user.id
  end

  def unfollow! other_user
    relationships.find_by_followed_id(other_user.id).destroy
  end
  
  #....model setup from params as usual...
 
  # @model.valid? #ensures we see all errors on the model in the view if the captcha fails
  #if verify_recaptcha(:model => @model, :message => "Please enter the correct captcha!") && @model.save
    #all ok so do as you would normally
  #else
    #model is not valid (that includes the captcha now! probably render the form again?
  #end
   #...rest of create action
   
  private
    def add_s_t_profile
      student_teacher_profile = StudentTeacherProfile.create! for_teaching_amount: '', on_leant_amount: '', to_learn: '', to_teach: '', user_id: id
    end

    def change_user_name
      self.username = self.username.split(/[.\s]/).join('_')
    end

end
