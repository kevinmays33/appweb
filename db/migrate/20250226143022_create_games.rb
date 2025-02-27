class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.timestamps
      t.integer :remaining_time
      t.integer :round_time
      t.string :name
      t.belongs_to :quiz, null: false, foreign_key: true
    end
  end
end
