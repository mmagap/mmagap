class AddUseridCategoryTagToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :user_id, :integer
    add_column :videos, :tags, :string
    add_column :videos, :category, :string
  end
end
