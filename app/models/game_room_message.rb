class GameRoomMessage < ApplicationRecord
  belongs_to :game_chat_room
  belongs_to :write_user
end
