class GameRoomMessagesController < ApplicationController

  def create
    @message = GameRoomMessage.new(game_room_id: params[:game_room_message][:room_id], write_user_id: current_user.id, body: params[:game_room_message][:body])
    @game_room = GameRoom.find(params[:game_room_message][:room_id])
    @participants = @game_room.participants
    @room_message = @game_room.game_room_messages

    respond_to do |format|
      if @message.save
        format.html { redirect_to game_room_path(params[:game_room_message][:room_id])}
        format.js { render :index }
      else
        format.html { redirect_to game_room_path(params[:game_room_message][:room_id]), notice: 'コメントに失敗しました'}
      end
    end

  end

  def destroy
    respond_to do |format|
      if GameRoomMessage.find(params[:id]).destroy
        format.html { redirect_to game_room_path(params[:room_id])}
        format.js { render :index }
      else
        format.html { redirect_to game_room_path(params[:game_room_message][:room_id])}
      end
    end
  end

end
