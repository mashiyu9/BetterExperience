class GameRoom < ApplicationRecord
  # belongs_to :game_chat_room
  has_many :participants, dependent: :destroy

  validates :game_title, presence: true
  validates :start_time, presence: true
  validates :play_time, presence: true
  validates :play_device, presence: true
  validates :room_name, presence: true


  enum play_device:{
    PlayStation: 0,
    Nintendo: 1,
    Steam: 2,
  }


end
