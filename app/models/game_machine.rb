class GameMachine < ApplicationRecord
  belongs_to :user

  enum game_device:{
    playstation: 0,
    nintendo: 1,
    steam: 2,
  }
end
