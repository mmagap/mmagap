class AddStProfileToCommets < ActiveRecord::Migration
  def change
    add_column :comments, :st_profile, :boolean, default: false
  end
end
