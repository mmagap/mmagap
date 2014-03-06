class RemoveTimeFromVideos < ActiveRecord::Migration
  def up
    remove_column :videos, :time
  end

  def down
    add_column :videos, :time, :integer
  end
end
