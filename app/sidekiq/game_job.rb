class GameJob
  include Sidekiq::Job

  def perform(*args)
    game = Game.find(args[0])
    return unless game.status == "idle"
    game.update(status: :started, remaining_time: game.round_time)
    while game.remaining_time > 0 do
      sleep 1
      game.update(remaining_time: game.remaining_time - 1)
    end
  end
end
