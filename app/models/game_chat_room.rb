class GameChatRoom < ApplicationRecord
  belongs_to :game_room
  has_many :game_room_messages
end
