class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_#{params[:room]}"
    ActionCable.server.broadcast("game_#{params[:room]}", { sent_by: current_user.email, body: "I have joined the game." })
  end

  def unsubscribed
    stream_from "game_#{params[:room]}"
    Game.find(params[:room]).users.delete(current_user)
    ActionCable.server.broadcast("game_#{params[:room]}", { sent_by: current_user.email, body: "I have left the game." })
  end
end
