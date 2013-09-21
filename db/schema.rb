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

ActiveRecord::Schema.define(version: 20120902190530) do

  create_table "ad_features", force: true do |t|
    t.integer  "subject_id"
    t.string   "subject_type"
    t.integer  "feature_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ad_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresses", force: true do |t|
    t.string   "subject_type"
    t.integer  "subject_id"
    t.string   "line1"
    t.string   "city"
    t.integer  "state_id"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
  end

  create_table "colleges", force: true do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "mascot"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "communities", force: true do |t|
    t.string   "name"
    t.integer  "college_id"
    t.decimal  "price_per_month", precision: 7, scale: 2
    t.text     "description"
    t.string   "email"
    t.string   "phone"
    t.string   "fax"
    t.string   "external_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "legacy_url"
  end

  create_table "documents", force: true do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "user_id"
    t.boolean  "primary",          default: false
    t.string   "title"
    t.string   "doc_file_name"
    t.string   "doc_content_type"
    t.integer  "doc_file_size"
    t.datetime "doc_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "features", force: true do |t|
    t.string   "name"
    t.boolean  "utility",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genders", force: true do |t|
    t.string   "name"
    t.datetime "disabled_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listings", force: true do |t|
    t.string   "title"
    t.string   "contact_email"
    t.string   "contact_phone"
    t.text     "description"
    t.boolean  "wanted",              default: false
    t.integer  "address_id"
    t.integer  "ad_status_id"
    t.integer  "college_id"
    t.integer  "community_id"
    t.integer  "creator_id"
    t.integer  "preferred_gender_id"
    t.integer  "available_bedrooms"
    t.integer  "total_bedrooms"
    t.integer  "price_per_month"
    t.date     "available_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_roles", force: true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                        null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.integer  "gender_id"
    t.integer  "user_status_id"
    t.datetime "disabled_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
  end

  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree

end
