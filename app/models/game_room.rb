class GameRoom < ApplicationRecord
  belongs_to :game_chat_room
  has_many :participants, dependent: :destroy
end
