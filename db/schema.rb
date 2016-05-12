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

ActiveRecord::Schema.define(version: 20160505204404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "eventbrites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "url",         null: false
    t.string   "title",       null: false
    t.text     "description"
    t.string   "address"
    t.string   "city"
    t.string   "event_id"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "venue"
    t.string   "artist"
    t.time     "time"
    t.date     "date"
    t.text     "logo_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "event_id",              null: false
    t.string   "name",       limit: 50
    t.integer  "size",       limit: 2,  null: false
    t.integer  "owner_id",              null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "groups", ["event_id"], name: "index_groups_on_event_id", using: :btree
  add_index "groups", ["owner_id"], name: "index_groups_on_owner_id", using: :btree

  create_table "groups_tags", force: :cascade do |t|
    t.integer  "tag_id",     null: false
    t.integer  "group_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groups_tags", ["group_id"], name: "index_groups_tags_on_group_id", using: :btree

  create_table "groups_users", force: :cascade do |t|
    t.integer  "group_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groups_users", ["group_id"], name: "index_groups_users_on_group_id", using: :btree
  add_index "groups_users", ["user_id"], name: "index_groups_users_on_user_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_users", force: :cascade do |t|
    t.integer  "tag_id",     null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags_users", ["user_id"], name: "index_tags_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "token"
    t.string   "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
