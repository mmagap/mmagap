class CreateCommentLikes < ActiveRecord::Migration
  def change
    create_table :comment_likes do |t|
      t.boolean :like_or_not
      t.integer :comment_id

      t.timestamps
    end
    add_index :comment_likes, :comment_id
  end
end
