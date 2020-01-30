class Participant < ApplicationRecord
  belongs_to :game_room
  belongs_to :participant, class_name: "User"
  has_many :game_room_messages, dependent: :destroy
end
