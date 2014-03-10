class ChangeIsactivecolumnInVideos < ActiveRecord::Migration
  def up
    change_column :videos, :is_active, 'boolean USING CAST(is_active AS boolean)'
  end

  def down
    change_column :videos, :is_active, :string
  end
end
