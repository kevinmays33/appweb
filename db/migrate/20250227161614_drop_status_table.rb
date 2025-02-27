class DropStatusTable < ActiveRecord::Migration[8.0]
  def change
    remove_column :games, :status
    add_column :games, :status, :integer, default: 0
  end
end
