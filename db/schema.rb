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

ActiveRecord::Schema.define(version: 20180228231026) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "login"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "marks", force: :cascade do |t|
    t.integer  "admin_id"
    t.integer  "proposal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["admin_id", "proposal_id"], name: "index_marks_on_admin_id_and_proposal_id", unique: true
  end

  create_table "parties", force: :cascade do |t|
    t.datetime "from",          null: false
    t.datetime "to",            null: false
    t.datetime "proposal_from", null: false
    t.datetime "proposal_to",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposals", force: :cascade do |t|
    t.integer  "party_id",          null: false
    t.string   "firstname"
    t.boolean  "firstname_private"
    t.string   "surname"
    t.boolean  "surname_private"
    t.string   "nickname"
    t.string   "twitter"
    t.string   "personnal_site"
    t.string   "format"
    t.string   "title"
    t.text     "description"
    t.string   "email"
    t.string   "phone"
    t.text     "availability"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "nickname_private"
    t.string   "entity"
    t.string   "entity_site"
    t.string   "mastodon"
  end

end
