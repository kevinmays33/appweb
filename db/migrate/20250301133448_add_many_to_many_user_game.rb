class AddManyToManyUserGame < ActiveRecord::Migration[8.0]
  def change
    create_table :users_games, primary_key: [:user_id, :game_id] do |t|
      t.belongs_to :user
      t.belongs_to :game
      t.integer :score
      t.timestamps
    end
  end
end
