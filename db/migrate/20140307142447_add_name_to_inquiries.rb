class AddNameToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :name, :string
  end
end
