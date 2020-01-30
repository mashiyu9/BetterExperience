# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_23_062131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blacklists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "block_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block_user_id"], name: "index_blacklists_on_block_user_id"
    t.index ["user_id", "block_user_id"], name: "index_blacklists_on_user_id_and_block_user_id", unique: true
    t.index ["user_id"], name: "index_blacklists_on_user_id"
  end

  create_table "chat_groups", force: :cascade do |t|
    t.bigint "chat_room_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_chat_groups_on_chat_room_id"
    t.index ["user_id"], name: "index_chat_groups_on_user_id"
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.integer "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_chat_rooms", force: :cascade do |t|
    t.bigint "game_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_room_id"], name: "index_game_chat_rooms_on_game_room_id"
  end

  create_table "game_machines", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "game_device"
    t.string "device_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_game_machines_on_user_id"
  end

  create_table "game_room_messages", force: :cascade do |t|
    t.bigint "game_chat_room_id"
    t.bigint "write_user_id"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_chat_room_id"], name: "index_game_room_messages_on_game_chat_room_id"
    t.index ["write_user_id"], name: "index_game_room_messages_on_write_user_id"
  end

  create_table "game_rooms", force: :cascade do |t|
    t.string "game_title", null: false
    t.string "comment"
    t.boolean "vc_possible", null: false
    t.boolean "available_skype", default: false, null: false
    t.boolean "available_discord", default: false, null: false
    t.boolean "available_twitter", default: false, null: false
    t.boolean "available_ingame_vc", default: false, null: false
    t.datetime "start_time", default: -> { "now()" }, null: false
    t.integer "play_time", null: false
    t.integer "play_device", null: false
    t.boolean "open_twitter", default: false, null: false
    t.string "close_message"
    t.string "room_name", default: "誰でも歓迎", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "chat_room_id"
    t.bigint "user_id"
    t.string "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "game_room_id"
    t.bigint "participant_id"
    t.integer "state", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_room_id"], name: "index_participants_on_game_room_id"
    t.index ["participant_id"], name: "index_participants_on_participant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "name", null: false
    t.string "profile"
    t.string "twitter_address"
    t.string "skype_id"
    t.string "discord_id"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chat_groups", "chat_rooms"
  add_foreign_key "chat_groups", "users"
  add_foreign_key "game_chat_rooms", "game_rooms"
  add_foreign_key "game_machines", "users"
  add_foreign_key "game_room_messages", "game_chat_rooms"
  add_foreign_key "game_room_messages", "users", column: "write_user_id"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "participants", "game_rooms"
  add_foreign_key "participants", "users", column: "participant_id"
end
