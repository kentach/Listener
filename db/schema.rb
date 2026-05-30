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

ActiveRecord::Schema[7.2].define(version: 2026_05_27_065526) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audios", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.string "title", null: false
    t.string "file_name", null: false
    t.text "script"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_audios_on_lesson_id"
  end

  create_table "booklists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "textbook_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["textbook_id"], name: "index_booklists_on_textbook_id"
    t.index ["user_id", "textbook_id"], name: "index_booklists_on_user_id_and_textbook_id", unique: true
    t.index ["user_id"], name: "index_booklists_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "audio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["audio_id"], name: "index_favorites_on_audio_id"
    t.index ["user_id", "audio_id"], name: "index_favorites_on_user_id_and_audio_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "learning_records", force: :cascade do |t|
    t.boolean "completed"
    t.integer "play_count"
    t.bigint "user_id", null: false
    t.bigint "audio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["audio_id"], name: "index_learning_records_on_audio_id"
    t.index ["user_id", "audio_id"], name: "index_learning_records_on_user_id_and_audio_id", unique: true
    t.index ["user_id"], name: "index_learning_records_on_user_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.bigint "textbook_id", null: false
    t.string "title", null: false
    t.string "learning_mode", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["textbook_id"], name: "index_lessons_on_textbook_id"
  end

  create_table "textbooks", force: :cascade do |t|
    t.string "name", null: false
    t.string "level", null: false
    t.string "series", null: false
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "eiken_level", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "audios", "lessons"
  add_foreign_key "booklists", "textbooks"
  add_foreign_key "booklists", "users"
  add_foreign_key "favorites", "audios"
  add_foreign_key "favorites", "users"
  add_foreign_key "learning_records", "audios"
  add_foreign_key "learning_records", "users"
  add_foreign_key "lessons", "textbooks"
end
