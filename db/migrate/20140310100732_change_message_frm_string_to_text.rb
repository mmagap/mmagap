class ChangeMessageFrmStringToText < ActiveRecord::Migration
  def up
     change_column :inquiries, :message, :text
  end

  def down
    change_column :inquiries, :message, :string 
  end
end
