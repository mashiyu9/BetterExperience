class GameRoomMessage < ApplicationRecord
  belongs_to :game_chat_room, class_name: "Participant"
  belongs_to :write_user, class_name: "Participant"
end
