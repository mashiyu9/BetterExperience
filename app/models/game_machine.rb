class GameMachine < ApplicationRecord
  belongs_to :user

  enum device:{
    playstationID: 0,
    nintendoID: 1,
    stermID: 2,
  }
end
