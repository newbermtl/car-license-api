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

ActiveRecord::Schema[7.2].define(version: 2024_08_19_192539) do
  create_table "car_owners", force: :cascade do |t|
    t.integer "car_id", null: false
    t.integer "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_car_owners_on_car_id"
    t.index ["owner_id"], name: "index_car_owners_on_owner_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "model"
    t.string "brand"
    t.integer "year"
    t.string "license"
    t.boolean "legal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "modifications", force: :cascade do |t|
    t.string "name"
    t.integer "car_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_modifications_on_car_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "car_owners", "cars"
  add_foreign_key "car_owners", "owners"
  add_foreign_key "modifications", "cars"
end
