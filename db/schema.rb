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

ActiveRecord::Schema.define(version: 20160623013140) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aliexpresses", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crawlers", force: :cascade do |t|
    t.integer  "aliexpress_id"
    t.integer  "wordpress_id"
    t.boolean  "enabled",       default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "crawlers", ["aliexpress_id"], name: "index_crawlers_on_aliexpress_id", using: :btree
  add_index "crawlers", ["wordpress_id"], name: "index_crawlers_on_wordpress_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.integer  "wordpress_id"
    t.string   "aliexpress_link"
    t.integer  "option_1"
    t.integer  "option_2"
    t.integer  "option_3"
    t.integer  "shipping"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "wordpresses", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "consumer_key"
    t.string   "consumer_secret"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "crawlers", "aliexpresses"
  add_foreign_key "crawlers", "wordpresses"
end
