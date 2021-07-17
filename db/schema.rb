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

ActiveRecord::Schema.define(version: 2021_07_12_010750) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "angkutans", force: :cascade do |t|
    t.string "id_angkutan"
    t.string "id_trayek"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jalans", force: :cascade do |t|
    t.string "id_jalan", null: false
    t.string "nama_jalan", null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lokasis", force: :cascade do |t|
    t.bigint "jalan_id", null: false
    t.string "id_lokasi"
    t.string "id_jalan"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["jalan_id"], name: "index_lokasis_on_jalan_id"
  end

  create_table "rutes", force: :cascade do |t|
    t.bigint "jalan_id", null: false
    t.string "id_rute"
    t.string "id_angkutan"
    t.string "id_jalan"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["jalan_id"], name: "index_rutes_on_jalan_id"
  end

  add_foreign_key "lokasis", "jalans"
  add_foreign_key "rutes", "jalans"
end
