class GameMachine < ApplicationRecord
  belongs_to :user

  enum game_device:{
    playstation: 0,
    Nintendo: 1,
    PC_steam: 2,
  }
end
