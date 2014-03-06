class AddVideoIdToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :video_id, :integer
  end
end
