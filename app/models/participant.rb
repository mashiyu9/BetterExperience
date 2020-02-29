class Participant < ApplicationRecord
  belongs_to :game_room
  belongs_to :participant, class_name: "User"
  has_many :game_room_messages

  validates :participant_id, presence: true
  validates :state, presence: true

  scope :search_current_user, -> (current_user) {where(participant_id: current_user)}
  scope :owner, -> {find_by(state: 0)}
  scope :user_tied_game_room, -> (gr, user) {find_by(game_room_id: gr.id, participant_id: user.id)}
  scope :user_exists, -> (current_user) {find_by(participant_id: current_user.id)}

  enum state:{
    "募集主": 0,
    "参加希望者": 1,
    "参加確定者": 2,
  }

end
