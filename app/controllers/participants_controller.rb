class ParticipantsController < ApplicationController
  def create
    @participant = Participant.new(participant_id: current_user.id, state: 1, game_room_id: params[:participant_id])
    if @participant.save
      redirect_to game_rooms_path
    else
      redirect_to game_rooms_path
    end
  end


  def update
    @participant = Participant.find(params[:id])
    if @participant.update(state: 2)
      redirect_to game_room_path(params[:room_id])
    end
  end

  def destroy
    Participant.find_by(participant_id: params[:user_id]).destroy
    redirect_to game_room_path(params[:room_id])
  end
end
