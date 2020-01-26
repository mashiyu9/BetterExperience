class GameRoomsController < ApplicationController
  def new
    @game_room = GameRoom.new
  end
end
