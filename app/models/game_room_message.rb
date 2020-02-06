class GameRoomMessage < ApplicationRecord
  belongs_to :game_room
  belongs_to :write_user, class_name: 'User'
end
