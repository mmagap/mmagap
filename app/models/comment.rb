class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id, :parent_id, :commentable_type, :commentable_id  
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :comment_likes

  validates :content, :user_id, presence: true

  def was_not_liked_by? user
    !self.comment_likes.find_by_user_id(user.id)
  end

  def was_liked_positive_by? user_id
    user_like = self.comment_likes.find_by_user_id(user_id)
    user_like.like_or_not if user_like
  end
end 
