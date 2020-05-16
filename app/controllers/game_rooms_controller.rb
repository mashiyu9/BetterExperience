class GameRoomsController < ApplicationController
  before_action :authenticate_user!

  require 'date'

  before_action :set_game_title

  helper_method :condition_fullfill, :need_conditions, :can_make_request, :find_owner_info

  PER = 12

  def index
    @q = GameRoom.all.includes([:participants, :users]).ransack(params[:q])
    @game_rooms = @q.result(distinct: true).valid_time_room.page(params[:page]).per(PER)

    if params[:keyword]
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword],tag_ids: 1005402)
    end
  end

  def new
    @game_room = GameRoom.new
  end

  def create
    @game_room = GameRoom.new(game_room_params)
    @game_room.participants.build(user_id: current_user.id, state: 0)

    if @game_room.save
      redirect_to game_rooms_path
      flash[:notice] = t('game_rooms.index.create_room')
    else
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
    @messages = @game_room.game_room_messages
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

  def find_owner_info(gr)
    @owner = gr.participants.owner.user
  end
  # ownerではなく、ゲームルームに参加中でもなく参加希望も出していな状態かどうかチェックしている
  def can_make_request(gr)
    gr.user_not_owner?(current_user) && gr.user_exists?(current_user.id) == false ? true : false
  end

  # 一つでも[true,false]の組み合わせがあったらfalseになるメソッド(true,falseの組み合わせになったら、情報が足りていないということ),不足しているものがあるかどうかチェックするメソッド
  def condition_fullfill(user, gr)
    [
      [gr.available_twitter?, user.twitter_address.present?],
      [gr.available_skype?, user.skype_id.present?],
      [gr.available_discord?, user.discord_id.present?],
      [gr.play_device == "PlayStation", user.game_machines.check_playstation_id_present],
      [gr.play_device == "Nintendo", user.game_machines.check_steam_id_present],
      [gr.play_device == "Steam", user.game_machines.check_nintendo_id_present],
    ].all? do |pair|
      pair != [true,false]
    end
  end
 # 足りていない情報を出力するメソッド
  def need_conditions(user, gr)
    result = {}
    result.merge!(skype: user.skype_id.blank?) if gr.available_skype?
    result.merge!(discord: user.discord_id.blank?) if gr.available_discord?
    result.merge!(twitter: user.twitter_address.blank?) if gr.available_twitter?
    result.merge!(PlayStation: user.game_machines.find_by(game_device: "PlayStation").device_id.blank?) if gr.play_device == "PlayStation"
    result.merge!(Nintendo: user.game_machines.find_by(game_device: "Nintendo").device_id.blank?) if gr.play_device == "Nintendo"
    result.merge!(Steam: user.game_machines.find_by(game_device: "Steam").device_id.blank?) if gr.play_device == "Steam"
    result.select{|_, v| v == true}.keys
  end


  private
  def set_game_title
    @game_titles = [
      t('game_rooms.index.title1'),
      t('game_rooms.index.title2'),
      t('game_rooms.index.title3'),
      t('game_rooms.index.title4'),
      t('game_rooms.index.title5'),
      t('game_rooms.index.title6'),
      t('game_rooms.index.title7'),
      t('game_rooms.index.title8'),
    ]
  end

  def game_room_params
    params.require(:game_room).permit(:game_title, :comment, :vc_possible, :available_skype, :available_discord, :available_twitter, :available_ingame_vc, :start_time, :play_time, :play_device, :open_twitter, :close_info, :close_message, :room_name)
  end

  def sign_in?
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
