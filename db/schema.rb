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

ActiveRecord::Schema.define(version: 2021_12_13_003455) do

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "team"
    t.string "position"
    t.float "attempts_per_game"
    t.float "attempts"
    t.float "yards"
    t.float "yards_per_attempt"
    t.float "yards_per_game"
    t.float "touchdowns"
    t.string "longest_rush"
    t.float "first_downs"
    t.float "first_down_percentage"
    t.float "twenty_yards"
    t.float "forty_yards"
    t.float "fumbles"
  end

end
