class AddAttachmentPhotoToCmsPages < ActiveRecord::Migration
  def self.up
    change_table :cms_pages do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :cms_pages, :photo
  end
end
