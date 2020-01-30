class Participant < ApplicationRecord
  belongs_to :game_room
  belongs_to :participant, class_name: "User"
  has_many :game_room_messages, dependent: :destroy

  enum state:{
    "募集主": 0,
    "参加希望者": 1,
    "参加確定者": 2,
  }
end
