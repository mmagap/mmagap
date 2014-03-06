class RemoveStateFromVideos < ActiveRecord::Migration
  def up
    remove_column :videos, :state
  end

  def down
    add_column :videos, :state, :string
  end
end
