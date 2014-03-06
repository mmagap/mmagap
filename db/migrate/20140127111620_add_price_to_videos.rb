class AddPriceToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :price, :string
  end
end
