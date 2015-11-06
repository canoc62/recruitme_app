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

ActiveRecord::Schema.define(version: 20151104073117) do

  create_table "game_stats", force: :cascade do |t|
    t.string   "opponent"
    t.integer  "pass_attempts"
    t.integer  "pass_yards"
    t.integer  "pass_tds"
    t.integer  "rush_attempts"
    t.integer  "rush_yards"
    t.integer  "rush_tds"
    t.integer  "receptions"
    t.integer  "receiving_yds"
    t.integer  "receiving_tds"
    t.integer  "tackles"
    t.integer  "sacks"
    t.integer  "interceptions"
    t.integer  "field_goals_attempts"
    t.integer  "field_goals_made"
    t.integer  "pat_attempts"
    t.integer  "pat_made"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_positions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "position_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", force: :cascade do |t|
    t.string   "position_title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_years", force: :cascade do |t|
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "age"
    t.string   "height"
    t.string   "weight"
    t.string   "city"
    t.string   "state"
    t.string   "school"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.integer  "school_year_id"
  end

end
