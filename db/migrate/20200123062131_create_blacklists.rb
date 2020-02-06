class CreateBlacklists < ActiveRecord::Migration[5.2]
  def change
    create_table :blacklists do |t|
      t.integer :user_id
      t.integer :block_user_id

      t.timestamps
    end
    add_index :blacklists, :user_id
    add_index :blacklists, :block_user_id
    add_index :blacklists, [:user_id, :block_user_id], unique: true
  end
end
