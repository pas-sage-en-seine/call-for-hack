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

ActiveRecord::Schema.define(version: 20141005195244) do

  create_table "parties", force: true do |t|
    t.date     "from",          null: false
    t.date     "to",            null: false
    t.date     "proposal_from", null: false
    t.date     "proposal_to",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposals", force: true do |t|
    t.integer  "party_id",          null: false
    t.text     "firstname"
    t.boolean  "firstname_private"
    t.text     "surname"
    t.boolean  "surname_private"
    t.text     "nickname"
    t.text     "avatar"
    t.text     "twitter"
    t.text     "site"
    t.text     "format"
    t.text     "minimal_duration"
    t.text     "optimal_duration"
    t.text     "maximal_duration"
    t.text     "title"
    t.text     "description"
    t.text     "email"
    t.text     "phone"
    t.text     "availability"
    t.text     "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
