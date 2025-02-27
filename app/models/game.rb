class Game < ApplicationRecord
  belongs_to :quiz

  enum :status, [ :idle, :started, :finished ]

  after_update_commit -> { broadcast_prepend_to "timer", partial: "stream/timer", locals: { timer: self.remaining_time }, target: "timer" }
end
