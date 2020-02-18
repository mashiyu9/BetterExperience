class GameRoom < ApplicationRecord

  has_many :participants, dependent: :destroy
  has_many :game_room_messages, dependent: :destroy
  has_many :participant_user, through: :participants


  validates :game_title, presence: true
  validates :start_time, presence: true
  validates :play_time, presence: true
  validates :play_device, presence: true
  validates :room_name, presence: true
  # validates :start_time, presence: true, date: true

  enum play_device:{
    PlayStation: 0,
    Nintendo: 1,
    Steam: 2,
  }

end
