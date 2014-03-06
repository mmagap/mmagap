class CmspagesColumnName < ActiveRecord::Migration
  def up
     rename_column :cms_pages, :desc, :description
   
  end

  def down
  end
end
