class AddIsActiveToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :is_active, :string
  end
end
