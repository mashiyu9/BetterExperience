class GameRoomsController < ApplicationController
  before_action :authenticate_user!


  def index
    @q = GameRoom.ransack(params[:q])
    @game_rooms = @q.result(distinct: true)
  end

  def new
    @game_room = GameRoom.new
  end

  def create
    @game_room = GameRoom.new(game_room_params)
    @game_room.participants.build(id: @game_room.id, participant_id: current_user.id, state: 0)
    binding.irb
    # @game_chat_room = GameChatRoom.new(game_room_id: @game_room.id)


    if ActiveRecord::Type::Boolean.new.cast(params[:game_room][:available_skype])
      @game_room.update_attributes(available_skype: true)
    else
      @game_room.update_attributes(available_skype: false)
    end

    if ActiveRecord::Type::Boolean.new.cast(params[:game_room][:vc_possible])
      @game_room.update_attributes(vc_possible: true)
    else
      @game_room.update_attributes(vc_possible: false)
    end

    if ActiveRecord::Type::Boolean.new.cast(params[:game_room][:available_discord])
      @game_room.update_attributes(available_discord: true)
    else
      @game_room.update_attributes(available_discord: false)
    end

    if ActiveRecord::Type::Boolean.new.cast(params[:game_room][:available_ingame_vc])
      @game_room.update_attributes(available_ingame_vc: true)
    else
      @game_room.update_attributes(available_ingame_vc: false)
    end

    if ActiveRecord::Type::Boolean.new.cast(params[:game_room][:available_twitter])
      @game_room.update_attributes(available_twitter: true)
    else
      @game_room.update_attributes(available_twitter: false)
    end

    if ActiveRecord::Type::Boolean.new.cast(params[:game_room][:open_twitter])
      @game_room.update_attributes(open_twitter: true)
    else
      @game_room.update_attributes(open_twitter: false)
    end


    binding.irb
    if @game_room.save
      binding.irb
      redirect_to game_rooms_path
    else
      binding.irb
      render "new"
    end

  end

  def show
    @game_room = GameRoom.find(params[:id])
    if @game_room.participants.search_current_user(current_user.id).blank?
      redirect_to game_rooms_path
    end
    @participants = @game_room.participants
    @owner = @participants.owner
    @room_message = @game_room.game_room_messages
  end

  def edit
    @game_room = GameRoom.find(params[:id])
  end

  def update
    @game_room = GameRoom.find(params[:id])
    if @game_room.update(game_room_params)
      redirect_to @game_room
    else
      render :edit
    end
  end

  private

  def game_room_params
    params.require(:game_room).permit(:game_title, :comment, :vc_possible, :available_skype, :available_discord, :available_twitter, :available_ingame_vc, :start_time, :play_time, :play_device, :open_twitter, :close_info, :close_message, :room_name)
  end

  def sign_in?
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end



end
