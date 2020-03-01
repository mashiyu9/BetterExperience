class GameMachine < ApplicationRecord
  belongs_to :user

  enum game_device:{
    PlayStation: 0,
    Nintendo: 1,
    Steam: 2,
  }

  scope :check_playstation_id_present, -> {find_by(game_device: "PlayStation").device_id.present?}
  scope :check_steam_id_present, -> {find_by(game_device: "Steam").device_id.present?}
  scope :check_nintendo_id_present, -> {find_by(game_device: "Nintendo").device_id.present?}
end
