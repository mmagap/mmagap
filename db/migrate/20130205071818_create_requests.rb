class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :message
      t.integer :user_id

      t.timestamps
    end
  end
end
