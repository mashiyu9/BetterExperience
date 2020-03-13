class GameRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # ActionCable.server.broadcast 'game_room_channel', message: data['message']
    ActionCable.server.broadcast 'game_room_channel', message: data['message']
  end
end
