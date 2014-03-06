class Cmspagesexcerpt < ActiveRecord::Migration
  def up
      rename_column :cms_pages, :sort_desc, :excerpt
  end

  def down
  end
end
