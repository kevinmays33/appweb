class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy
  validates :topic, presence: true

  # broadcasts_to ->(quiz) { "quizzes" }, inserts_by: :prepend

  def length
    questions.length
  end
end
