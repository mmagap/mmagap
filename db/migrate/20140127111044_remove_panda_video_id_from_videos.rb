class RemovePandaVideoIdFromVideos < ActiveRecord::Migration
  def up
    remove_column :videos, :panda_video_id
  end

  def down
    add_column :videos, :panda_video_id, :string
  end
end
