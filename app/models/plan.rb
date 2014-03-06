class Plan < ActiveRecord::Base
	attr_accessible :name, :price , :time, :video_id
	belongs_to :video
  has_many :subscriptions
end
