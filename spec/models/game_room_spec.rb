require 'rails_helper'

RSpec.describe GameRoom, type: :model do
  it 'game_titleが入力されていないといけない' do
    @game_room = GameRoom.new(
      game_title: "",
      comment: "",
      vc_possible: false,
      available_skype: false,
      available_discord: false,
      available_twitter: false,
      available_ingame_vc: false,
      start_time: "2019/11/10/12/22"
    )
    expect(@game_room).not_to be_valid
  end

  it 'ゲーム開始時間が入力されていないといけない' do
    @game_room = GameRoom.new(
      game_title: "test",
      comment: "",
      vc_possible: false,
      available_skype: false,
      available_discord: false,
      available_twitter: false,
      available_ingame_vc: false,
      start_time: "2019/11/10/12/22"
    )
    expect(@game_room).not_to be_valid
  end

  it '遊ぶ時間が入力されていないといけない' do
    @game_room = GameRoom.new(
      game_title: "test",
      comment: "",
      vc_possible: false,
      available_skype: false,
      available_discord: false,
      available_twitter: false,
      available_ingame_vc: false,
      start_time: "2019/11/10/12/22",
      play_time: 0,
    )
    expect(@game_room).not_to be_valid
  end

  it '遊ぶ機種が選択されていないといけない' do
    @game_room = GameRoom.new(
      game_title: "test",
      comment: "",
      vc_possible: false,
      available_skype: false,
      available_discord: false,
      available_twitter: false,
      available_ingame_vc: false,
      start_time: 1,
    )
    expect(@game_room).not_to be_valid
  end

  it '部屋の名前が入力されていないとバリデーションが通らない' do
    @game_room = GameRoom.new(
      game_title: "test",
      comment: "",
      vc_possible: false,
      available_skype: false,
      available_discord: false,
      available_twitter: false,
      available_ingame_vc: false,
      start_time: "",
      room_name: "",
    )
    expect(@game_room).not_to be_valid
  end

end