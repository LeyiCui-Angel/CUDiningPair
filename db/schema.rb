# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20231113142754) do

  create_table "pairings", force: :cascade do |t|
    t.integer  "restaurant_id",            null: false
    t.integer  "target_number_of_people"
    t.integer  "current_number_of_people"
    t.datetime "meeting_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pairings_users", id: false, force: :cascade do |t|
    t.integer "pairing_id"
    t.integer "user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.decimal "custom_id"
    t.string  "name"
    t.string  "location"
    t.decimal "rating",      precision: 3, scale: 1
    t.decimal "ratingcount"
    t.string  "cuisine"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",             null: false
    t.string   "uni",               null: false
    t.datetime "verified_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "verification_code"
    t.string   "password_digest"
    t.string   "gender"
    t.string   "mbti"
  end

  add_index "users", ["uni"], name: "index_users_on_uni", unique: true

end
