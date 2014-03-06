class CommentLike < ActiveRecord::Base
  attr_accessible :comment_id, :like_or_not, :user_id
  validates :comment_id, presence: true
  validates :like_or_not, :inclusion => [ true, false ]

  belongs_to :comment 

  def was_liked_by_this_user? user_id
    !self.comment.comment_likes.where(user_id: user_id).empty?
  end

end
