class AddFieldToQuiz < ActiveRecord::Migration[8.0]
  def change
    add_column :quizzes, :time_between_question, :integer
  end
end
