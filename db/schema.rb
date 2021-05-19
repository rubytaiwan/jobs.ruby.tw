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

ActiveRecord::Schema.define(version: 2015_03_14_031835) do

  create_table "jobs", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "title"
    t.string "job_type"
    t.string "occupation"
    t.string "company_name"
    t.string "location"
    t.string "url"
    t.text "description"
    t.text "apply_information"
    t.date "deadline"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "aasm_state"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "roles", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "name", limit: 30
  end

  create_table "users", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "password_salt"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "reset_password_sent_at"
    t.integer "role_id", default: 1
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "users", "roles"
end
