class Participant < ApplicationRecord
  belongs_to :game_room
  belongs_to :user, class_name: "User"
  has_many :game_room_messages

  validates :user_id, presence: true
  validates :state, presence: true

  scope :search_current_user, -> (current_user) {where(user_id: current_user)}
  scope :owner, -> {find_by(state: 0)}
  scope :user_tied_game_room, -> (gr, user) {find_by(game_room_id: gr.id, user_id: user.id)}
  scope :user_exists, -> (current_user) {find_by(user_id: current_user.id)}

  enum state:{
    "募集主": 0,
    "参加希望者": 1,
    "参加確定者": 2,
  }

end
