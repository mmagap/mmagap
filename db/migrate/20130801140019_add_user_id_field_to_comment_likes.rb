class AddUserIdFieldToCommentLikes < ActiveRecord::Migration
  def change
    add_column :comment_likes, :user_id, :integer
  end
end
