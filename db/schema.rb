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

ActiveRecord::Schema.define(version: 20151220131540) do

  create_table "appointement_indicators", force: :cascade do |t|
    t.integer  "appointement_id"
    t.integer  "indicator_id"
    t.string   "result"
    t.string   "range"
    t.boolean  "in_range"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "appointement_indicators", ["appointement_id"], name: "index_appointement_indicators_on_appointement_id"
  add_index "appointement_indicators", ["indicator_id"], name: "index_appointement_indicators_on_indicator_id"

  create_table "appointements", force: :cascade do |t|
    t.integer  "patient_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "appointements", ["patient_id"], name: "index_appointements_on_patient_id"

  create_table "indicators", force: :cascade do |t|
    t.string   "name"
    t.string   "range"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "sex"
    t.date     "date_of_birth"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
