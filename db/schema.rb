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

ActiveRecord::Schema[7.0].define(version: 2023_11_09_165425) do
  create_table "combat_rating_params", force: :cascade do |t|
    t.string "star_destroyer_version"
    t.integer "tie_squadrons"
    t.integer "turbolasers"
    t.integer "ion_cannons"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interdiction_rating_params", force: :cascade do |t|
    t.string "star_destroyer_version"
    t.integer "gravity_engines"
    t.float "max_mass_shadow"
    t.float "power_drain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jump_rating_params", force: :cascade do |t|
    t.string "star_destroyer_version"
    t.float "motivator_power"
    t.float "cronau_factor"
    t.float "mass_shadow"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "star_destroyers", force: :cascade do |t|
    t.string "name"
    t.string "version"
    t.float "jump_rating"
    t.float "combat_rating"
    t.float "interdiction_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
