class CreateGameMachines < ActiveRecord::Migration[5.2]
  def change
    create_table :game_machines do |t|
      t.references :user, foreign_key: true
      t.integer :game_device
      t.string :device_id

      t.timestamps
    end
  end
end
