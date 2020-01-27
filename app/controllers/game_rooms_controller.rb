class GameRoomsController < ApplicationController
  def new
    @game_room = GameRoom.new
  end

  def create
    binding.irb
    @game_room = GameRoom.new(game_room_params)

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


    if @game_room.save
      redirect_to new_game_room_path
    else
      render "new"
    end

  end

  private

  def game_room_params
    params.require(:game_room).permit(:game_title, :comment, :vc_possible, :available_skype, :available_discord, :available_twitter, :available_ingame_vc, :start_time, :play_time, :play_device, :open_twitter, :close_info, :close_message, :room_name)
  end

end
