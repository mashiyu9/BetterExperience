class GameRoomMessagesController < ApplicationController

  def create
    @message = GameRoomMessage.new(game_room_id: params[:game_room_message][:room_id], write_user_id: current_user.id, body: params[:game_room_message][:body])
    # @message.save

    # redirect_to game_room_path(params[:game_room_message][:room_id])

    respond_to do |format|
      if @message.save
        format.js { render :index }
      else
        format.html { redirect_to game_room_path(params[:game_room_message][:room_id]), notice: 'コメントに失敗しました'}
      end
    end

  end

end
