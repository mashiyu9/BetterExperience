class ParticipantsController < ApplicationController
  def create
  end

  def update
    @participant = Participant.find(params[:id])
    if @participant.update(state: 2)
    end
  end

  def destroy
  end
end
