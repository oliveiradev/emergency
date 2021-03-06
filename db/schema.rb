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

ActiveRecord::Schema.define(version: 20150917221438) do

  create_table "occurrences", force: :cascade do |t|
    t.string   "description", limit: 255
    t.string   "pic",         limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "user_id",     limit: 4
    t.float    "lat",         limit: 24
    t.float    "lng",         limit: 24
    t.boolean  "pending",                 default: true
  end

  add_index "occurrences", ["user_id"], name: "index_occurrences_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "cpf",        limit: 255
    t.date     "birth"
    t.string   "password",   limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "checked",                default: false
  end

  add_foreign_key "occurrences", "users"
end
