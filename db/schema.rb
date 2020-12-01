# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_24_053348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.string "description"
    t.string "main_photo"
    t.string "photo_1"
    t.string "photo_2"
    t.string "photo_3"
    t.float "price"
    t.float "rating"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "session_id", null: false
    t.boolean "confirmed", default: false
    t.boolean "cancelled", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_bookings_on_session_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.integer "years_experience"
    t.date "date_started"
    t.string "certifications"
    t.boolean "verified"
    t.text "blurb"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_instructors_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "activity_id", null: false
    t.bigint "instructor_id", null: false
    t.string "title"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "capacity"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_sessions_on_activity_id"
    t.index ["instructor_id"], name: "index_sessions_on_instructor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "phone_number"
    t.string "open_id"
    t.string "profile_picture"
    t.string "role"
    t.string "address"
    t.string "motto"
    t.text "description"
    t.date "date_established"
    t.string "logo"
    t.string "photo"
    t.boolean "is_admin", default: false
    t.boolean "is_organizer", default: false
    t.boolean "is_parent", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "users"
  add_foreign_key "bookings", "sessions"
  add_foreign_key "bookings", "users"
  add_foreign_key "instructors", "users"
  add_foreign_key "sessions", "activities"
  add_foreign_key "sessions", "instructors"
end
