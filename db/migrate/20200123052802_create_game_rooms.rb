class CreateGameRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :game_rooms do |t|
      t.string :game_title, null: false
      t.string :comment
      t.boolean :vc_possible, null: false
      t.boolean :available_skype, null: false, default: false
      t.boolean :available_discord, null: false, default: false
      t.boolean :available_twitter, null: false, default: false
      t.boolean :available_ingame_vc, null: false, default: false
      t.datetime :start_time, null: false, default: -> { 'NOW()' }
      t.integer :play_time, null: false
      t.integer :play_device, null: false
      t.boolean :open_twitter, null: false, default: false
      t.string :close_message
      t.string :room_name, null: false, default: "誰でも歓迎"

      t.timestamps
    end
  end
end
