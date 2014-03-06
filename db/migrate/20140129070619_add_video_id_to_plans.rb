class AddVideoIdToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :video_id, :integer
  end
end
