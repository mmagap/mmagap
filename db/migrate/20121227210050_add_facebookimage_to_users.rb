class AddFacebookimageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebookimage, :string
  end
end
