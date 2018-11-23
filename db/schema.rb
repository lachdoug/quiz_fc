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

ActiveRecord::Schema.define(version: 2018_11_22_182345) do

  create_table "accounts", force: :cascade do |t|
    t.integer "accountable_id"
    t.string "accountable_type"
    t.decimal "balance", precision: 12, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.boolean "developer"
    t.boolean "quizmaster"
    t.boolean "comptroller"
    t.boolean "auditor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["unlock_token"], name: "index_admins_on_unlock_token", unique: true
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.string "currency"
    t.string "timezone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index [nil], name: "index_leagues_on_account_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "profile_id"
    t.string "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_members_on_league_id"
    t.index ["profile_id"], name: "index_members_on_profile_id"
    t.index [nil], name: "index_members_on_account_id"
  end

  create_table "plays", force: :cascade do |t|
    t.integer "quiz_id"
    t.integer "member_id"
    t.integer "status", default: 0
    t.text "answers"
    t.text "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_plays_on_member_id"
    t.index ["quiz_id"], name: "index_plays_on_quiz_id"
    t.index ["status"], name: "index_plays_on_status"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "quizbook_id", null: false
    t.integer "number"
    t.string "template"
    t.text "config"
    t.text "ask"
    t.string "answer"
    t.text "explanation"
    t.integer "points"
    t.text "scoring"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_questions_on_number"
    t.index ["quizbook_id"], name: "index_questions_on_quizbook_id"
  end

  create_table "quizbooks", force: :cascade do |t|
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status"], name: "index_quizbooks_on_status"
  end

  create_table "quizzes", force: :cascade do |t|
    t.integer "league_id"
    t.integer "quizbook_id"
    t.integer "status", default: 0
    t.integer "number"
    t.integer "fee"
    t.integer "pool"
    t.datetime "start"
    t.datetime "stop"
    t.datetime "tally"
    t.datetime "close"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["close"], name: "index_quizzes_on_close"
    t.index ["league_id"], name: "index_quizzes_on_league_id"
    t.index ["number"], name: "index_quizzes_on_number"
    t.index ["quizbook_id"], name: "index_quizzes_on_quizbook_id"
    t.index ["start"], name: "index_quizzes_on_start"
    t.index ["status"], name: "index_quizzes_on_status"
    t.index ["stop"], name: "index_quizzes_on_stop"
    t.index ["tally"], name: "index_quizzes_on_tally"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "account_id"
    t.decimal "amount", precision: 8, scale: 2
    t.integer "code"
    t.string "params"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_transactions_on_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
