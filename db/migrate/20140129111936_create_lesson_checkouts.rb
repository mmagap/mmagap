class CreateLessonCheckouts < ActiveRecord::Migration
  def change
    create_table :lesson_checkouts do |t|
      t.integer :user_id
      t.integer :video_id
      t.string :payment_status

      t.timestamps
    end
  end
end
