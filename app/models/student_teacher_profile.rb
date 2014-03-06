class StudentTeacherProfile < ActiveRecord::Base
  attr_accessible :for_teaching_amount, :on_leant_amount, :to_learn, :to_teach, :user_id

  belongs_to :user

  validates :for_teaching_amount, :on_leant_amount, :to_teach, :to_learn, length: { maximum: 200}

  has_many :comments, as: :commentable

end
