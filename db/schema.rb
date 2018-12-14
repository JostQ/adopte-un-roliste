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

ActiveRecord::Schema.define(version: 2018_12_14_121712) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "pseudo"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "roleplay_id"
    t.bigint "game_session_id"
    t.text "description"
    t.index ["game_session_id"], name: "index_characters_on_game_session_id"
    t.index ["roleplay_id"], name: "index_characters_on_roleplay_id"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "recipient_id"
    t.bigint "sender_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_comments_on_recipient_id"
    t.index ["sender_id"], name: "index_comments_on_sender_id"
  end

  create_table "game_sessions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "roleplay_id"
    t.boolean "end_game", default: false
    t.datetime "date"
    t.integer "players_limit"
    t.string "city"
    t.index ["creator_id"], name: "index_game_sessions_on_creator_id"
    t.index ["roleplay_id"], name: "index_game_sessions_on_roleplay_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "character_id"
    t.index ["character_id"], name: "index_inventories_on_character_id"
  end

  create_table "opinions", force: :cascade do |t|
    t.text "content"
    t.bigint "sender_id"
    t.bigint "recipient_id"
    t.bigint "game_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_session_id"], name: "index_opinions_on_game_session_id"
    t.index ["recipient_id"], name: "index_opinions_on_recipient_id"
    t.index ["sender_id"], name: "index_opinions_on_sender_id"
  end

  create_table "primary_specs", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "character_id"
    t.index ["character_id"], name: "index_primary_specs_on_character_id"
  end

  create_table "roleplays", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "game_master", default: "f"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "game_session_id"
    t.index ["game_session_id"], name: "index_roles_on_game_session_id"
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "secondary_specs", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "character_id"
    t.index ["character_id"], name: "index_secondary_specs_on_character_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "pseudo", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "characters", "game_sessions"
  add_foreign_key "characters", "roleplays"
  add_foreign_key "characters", "users"
  add_foreign_key "game_sessions", "roleplays"
  add_foreign_key "inventories", "characters"
  add_foreign_key "primary_specs", "characters"
  add_foreign_key "roles", "game_sessions"
  add_foreign_key "roles", "users"
  add_foreign_key "secondary_specs", "characters"
end
