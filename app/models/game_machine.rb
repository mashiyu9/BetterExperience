class GameMachine < ApplicationRecord
  belongs_to :user

  enum game_device:{
    PlayStation: 0,
    Nintendo: 1,
    Steam: 2,
  }
end
