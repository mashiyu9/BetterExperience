class GameChatRoomsController < ApplicationController
  def show
    @game_chat_room = GameChatRoom.find(params[:id])

  end
end
