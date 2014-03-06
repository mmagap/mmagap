class AddLessonUploadToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :lesson_upload, :string
  end
end
