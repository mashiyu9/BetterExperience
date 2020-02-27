class ParticipationsController < ApplicationController
  def new
    @participation_form = ParticipationForm.new(user_id: current_user.id)
  end
  def create
    @form
  end
end