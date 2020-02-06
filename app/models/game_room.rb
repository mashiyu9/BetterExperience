class GameRoom < ApplicationRecord

  has_many :participants, dependent: :destroy
  has_many :game_room_messages, dependent: :destroy

  # accepts_nested_attributes_for :game_chat_room, allow_destroy: true

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
