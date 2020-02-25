# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[5.2]
  def self.up
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.string :name
      t.string :profile
      t.string :twitter_address
      t.string :skype_id
      t.string :discord_id
      t.string :uid
      t.string :provider

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.inet     :current_sign_in_ip
      # t.inet     :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps null: false

    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  create_table :game_machines do |t|
      t.references :user, foreign_key: true
      t.integer :game_device
      t.string :device_id

      t.timestamps
  end
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
  create_table :participants do |t|
      t.references :game_room, foreign_key: true
      t.references :participant, foreign_key: { to_table: :users }
      t.integer :state, null: false, default: 0

      t.timestamps
  end
  create_table :game_chat_rooms do |t|
    t.references :game_room, foreign_key: true

    t.timestamps
  end
  create_table :game_room_messages do |t|
      t.references :game_room, foreign_key: true
      t.references :write_user, foreign_key: { to_table: :users }
      t.string :body

    t.timestamps
  end
  create_table :chat_rooms do |t|
      t.integer :name, null: false
      t.timestamps
  end
  create_table :chat_groups do |t|
      t.references :chat_room, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
  end
  create_table :messages do |t|
      t.references :chat_room, foreign_key: true
      t.references :user, foreign_key: true
      t.string :body, null: false

      t.timestamps
  end
  # def self.up
  #   create_table :blacklists do |t|
  #     t.integer :user_id
  #     t.integer :block_user_id

  #     t.timestamps
  #   end
  #   add_index :blacklists, :user_id
  #   add_index :blacklists, :block_user_id
  #   add_index :blacklists, [:user_id, :block_user_id], unique: true
  # end
end
  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end

end
