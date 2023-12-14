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

ActiveRecord::Schema.define(version: 20231214194948) do

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

  create_table "reviews", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.string   "user_name"
    t.decimal  "rating",        precision: 3, scale: 1
    t.decimal  "rating_count",  precision: 5, scale: 2
    t.text     "comment"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "reviews", ["restaurant_id"], name: "index_reviews_on_restaurant_id"

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["restaurant_id"], name: "index_subscriptions_on_restaurant_id"
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",             null: false
    t.string   "uni",               null: false
    t.datetime "verified_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "verification_code"
    t.string   "password_digest"
    t.integer  "gender"
    t.integer  "mbti"
  end

  add_index "users", ["uni"], name: "index_users_on_uni", unique: true

end
