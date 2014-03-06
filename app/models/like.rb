class Like < ActiveRecord::Base
  attr_accessible :user_id, :video_id
  belongs_to :video
  belongs_to :user

  validates :user_id, :video_id, presence: true
  validates :user_id, :uniqueness => { :scope => :video_id }
end
