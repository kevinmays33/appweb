class ChangeColumnName < ActiveRecord::Migration[8.0]
  def change
    rename_column :options, :option, :text
    rename_column :questions, :question, :text
    rename_column :quizzes, :quiz_length, :length
  end
end
