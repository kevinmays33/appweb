class Question < ApplicationRecord
  has_many :options, dependent: :destroy
  belongs_to :quiz
  validates :text, presence: true
end
