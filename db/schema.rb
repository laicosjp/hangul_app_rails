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

ActiveRecord::Schema[7.1].define(version: 2024_11_19_130051) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channels", force: :cascade do |t|
    t.string "title", null: false
    t.string "rss_link", null: false
    t.string "article_link", null: false
    t.string "generator", null: false, comment: "such as zenn.dev, medium.com, etc."
    t.datetime "last_build_at", null: false
    t.text "description"
    t.string "language", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "slug", null: false
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "thumbnail_url"
    t.integer "words_count", default: 0, null: false
    t.bigint "original_language_id"
    t.bigint "answer_language_id"
    t.index ["answer_language_id"], name: "index_courses_on_answer_language_id"
    t.index ["original_language_id"], name: "index_courses_on_original_language_id"
    t.index ["slug"], name: "index_courses_on_slug", unique: true
  end

  create_table "general_announcements", force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false, comment: "ISO 639"
    t.string "flag", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_languages_on_code", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "name", default: "アルダ初心者", null: false
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.datetime "left_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "word_choices", force: :cascade do |t|
    t.bigint "word_id", null: false
    t.bigint "choice_word_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["choice_word_id"], name: "index_word_choices_on_choice_word_id"
    t.index ["word_id", "choice_word_id"], name: "index_word_choices_on_word_id_and_choice_word_id", unique: true
    t.index ["word_id"], name: "index_word_choices_on_word_id"
  end

  create_table "word_records", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "word_id", null: false
    t.integer "status"
    t.datetime "first_studied_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "step", default: 0, null: false
    t.datetime "last_studied_at", default: "2024-08-26 02:53:39", null: false
    t.datetime "next_scheduled_question_at", default: "2024-08-26 02:53:39", null: false
    t.index ["user_id"], name: "index_word_records_on_user_id"
    t.index ["word_id", "user_id"], name: "index_word_records_on_word_id_and_user_id", unique: true
    t.index ["word_id"], name: "index_word_records_on_word_id"
  end

  create_table "words", force: :cascade do |t|
    t.string "name", null: false
    t.string "answer", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_words_on_course_id"
  end

  add_foreign_key "courses", "languages", column: "answer_language_id"
  add_foreign_key "courses", "languages", column: "original_language_id"
  add_foreign_key "word_choices", "words"
  add_foreign_key "word_choices", "words", column: "choice_word_id"
  add_foreign_key "word_records", "users"
  add_foreign_key "word_records", "words"
  add_foreign_key "words", "courses"
end
