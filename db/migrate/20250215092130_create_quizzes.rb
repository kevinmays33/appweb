class CreateQuizzes < ActiveRecord::Migration[8.0]
  def change
    create_table :quizzes do |t|
      t.timestamps
      t.string :topic
      t.integer :quiz_length
      t.string :name
    end
  end
end
