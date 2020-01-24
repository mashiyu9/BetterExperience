class UsersController < ApplicationController
  def new
    @user = User.new
    3.times do
      @user.game_machines.build
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:name, :email_address, :profile, :twitter_address, :skype_id, :discord_id, game_machines_attributes: [:game_device, :device_id])
  end

end
