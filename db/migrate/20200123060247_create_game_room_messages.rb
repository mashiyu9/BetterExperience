class CreateGameRoomMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :game_room_messages do |t|
      t.references :game_room, foreign_key: true
      t.references :write_user, foreign_key: { to_table: :users }
      t.string :body

      t.timestamps
    end
  end
end
