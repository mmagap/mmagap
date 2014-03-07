class AddMessageToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :message, :string
  end
end
