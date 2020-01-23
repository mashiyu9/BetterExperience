class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.references :game_room, foreign_key: true
      t.references :participant, foreign_key: { to_table: :users }
      t.integer :state, null: false, default: 0

      t.timestamps
    end
  end
end
