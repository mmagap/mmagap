class AddUpdatedAtToTags < ActiveRecord::Migration
  def change
    add_column :tags, :updated_at, :datetime
  end
end
