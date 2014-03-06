class AddTyVideoIdToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :yt_video_id, :string
    add_column :videos, :description, :string
  end
end
