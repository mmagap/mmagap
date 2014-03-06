class ChangeShortdescType < ActiveRecord::Migration
  def up
    change_column :cms_pages, :sort_desc, :text
  end

  def down
     change_column :cms_pages, :sort_desc, :string
  end
end

