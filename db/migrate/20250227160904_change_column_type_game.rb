class ChangeColumnTypeGame < ActiveRecord::Migration[8.0]
  def change
    change_column :games, :remaining_time, :integer, default: 0
  end
end
