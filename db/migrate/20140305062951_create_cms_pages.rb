class CreateCmsPages < ActiveRecord::Migration
  def change
    create_table :cms_pages do |t|
      t.string :title
      t.string :menu_title
      t.string :sort_desc
      t.text :desc
      t.string :photo
      t.boolean :is_active

      t.timestamps
    end
  end
end
