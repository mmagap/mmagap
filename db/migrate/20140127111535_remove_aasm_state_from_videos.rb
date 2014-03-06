class RemoveAasmStateFromVideos < ActiveRecord::Migration
  def up
    remove_column :videos, :aasm_state
  end

  def down
    add_column :videos, :aasm_state, :string
  end
end
