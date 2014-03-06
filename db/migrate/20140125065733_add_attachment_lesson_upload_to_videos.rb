class AddAttachmentLessonUploadToVideos < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.attachment :lesson_upload
    end
  end

  def self.down
    drop_attached_file :videos, :lesson_upload
  end
end
