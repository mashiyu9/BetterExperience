class ParticipantsController < ApplicationController
  before_action :authenticate_user!
  def create
    @participant = Participant.new(participant_id: current_user.id, state: 1, game_room_id: params[:participant_id])
    @current_user = current_user
    @owner_user = GameRoom.find(params[:participant_id]).participants.find_by(state: 0)
    if @participant.save
      redirect_to game_rooms_path
      GameRoomMailer.request_mail(@current_user, @owner_user).deliver
    else
      redirect_to game_rooms_path
    end
  end


  def update
    @participant = Participant.find(params[:id])
    if @participant.update(state: 2)
      GameRoomMailer.approval_mail(@participant.participant, @participant.game_room).deliver
      redirect_to game_room_path(params[:room_id])
    end
  end

  def destroy
    Participant.find_by(participant_id: params[:user_id]).destroy
    redirect_to game_room_path(params[:room_id])
  end
end
