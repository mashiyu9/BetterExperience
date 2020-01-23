class Participant < ApplicationRecord
  belongs_to :game_room
  belongs_to :user
end
