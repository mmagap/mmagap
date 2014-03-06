class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :video_id

      t.timestamps
    end
    add_index :likes, :user_id
    add_index :likes, :video_id
  end
end
