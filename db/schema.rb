# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160616144831) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.integer  "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "games", ["season_id", "created_at"], name: "index_games_on_season_id_and_created_at"
  add_index "games", ["season_id"], name: "index_games_on_season_id"

  create_table "leaderships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "leaderships", ["team_id"], name: "index_leaderships_on_team_id"
  add_index "leaderships", ["user_id", "team_id"], name: "index_leaderships_on_user_id_and_team_id", unique: true
  add_index "leaderships", ["user_id"], name: "index_leaderships_on_user_id"

  create_table "matches", force: :cascade do |t|
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "matches", ["game_id", "created_at"], name: "index_matches_on_game_id_and_created_at"
  add_index "matches", ["game_id"], name: "index_matches_on_game_id"

  create_table "matchups", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "matchups", ["match_id"], name: "index_matchups_on_match_id"
  add_index "matchups", ["team_id", "match_id"], name: "index_matchups_on_team_id_and_match_id", unique: true
  add_index "matchups", ["team_id"], name: "index_matchups_on_team_id"

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "memberships", ["team_id"], name: "index_memberships_on_team_id"
  add_index "memberships", ["user_id", "team_id"], name: "index_memberships_on_user_id_and_team_id", unique: true
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id"

  create_table "questions", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "game_id"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "questions", ["category_id", "created_at"], name: "index_questions_on_category_id_and_created_at"
  add_index "questions", ["category_id"], name: "index_questions_on_category_id"
  add_index "questions", ["game_id"], name: "index_questions_on_game_id"

  create_table "seasons", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "", null: false
    t.string   "frist_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
