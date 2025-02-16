class CreateQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :questions do |t|
      t.timestamps
      t.string :question
      t.belongs_to :quiz, null: false, foreign_key: true
    end
  end
end
