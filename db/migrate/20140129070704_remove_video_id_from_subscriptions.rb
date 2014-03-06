class RemoveVideoIdFromSubscriptions < ActiveRecord::Migration
  def up
    remove_column :subscriptions, :video_id
  end

  def down
    add_column :subscriptions, :video_id, :integer
  end
end
