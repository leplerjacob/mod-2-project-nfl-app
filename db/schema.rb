# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_16_181904) do

  create_table "coaches", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "bio"
    t.string "position"
    t.integer "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_coaches_on_team_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "date"
    t.integer "venue_id"
    t.integer "home_team_id"
    t.integer "away_team_id"
    t.integer "home_score"
    t.integer "away_acore"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["away_team_id"], name: "index_matches_on_away_team_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
    t.index ["venue_id"], name: "index_matches_on_venue_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "birth_date"
    t.integer "age"
    t.string "jersey"
    t.string "position"
    t.string "home_town"
    t.string "college"
    t.float "weight"
    t.float "height"
    t.text "bio"
    t.integer "user_id"
    t.integer "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_players_on_team_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "routines", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "date"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_routines_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.integer "wins"
    t.integer "losses"
    t.string "division"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "phone_number"
    t.integer "name_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name_id"], name: "index_users_on_name_id"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "state"
    t.integer "capacity"
    t.integer "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_venues_on_team_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "type"
    t.float "weight"
    t.integer "reps"
    t.string "date"
    t.float "distance"
    t.string "duration"
    t.integer "routine_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["routine_id"], name: "index_workouts_on_routine_id"
  end

  add_foreign_key "routines", "users"
end
