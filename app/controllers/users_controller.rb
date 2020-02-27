class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])

    @owner_room = []
    @owner_room_id = []
    @user.participants.where(state: 0).each do |x|
      @owner_room_id.push(x.game_room_id)
    end
    @owner_room_id.each do |x|
      @owner_room.push GameRoom.find(x)
    end
    # day = Date.today - 1
    # @owner_room.where('start_time >= ?', day)

    @hope_room = []
    @hope_room_id = []
    @user.participants.where(state: 1).each do |x|
      @hope_room_id.push(x.game_room_id)
    end
    @hope_room_id.each do |x|
      @hope_room.push GameRoom.find(x)
    end

    @participants_room = []
    @participants_room_id = []
    @user.participants.where(state: 2).each do |x|
      @participants_room_id.push(x.game_room_id)
    end
    @participants_room_id.each do |x|
      @participants_room.push GameRoom.find(x)
    end

    @game_machine = @user.game_machines
  end
end
