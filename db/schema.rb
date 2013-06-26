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

ActiveRecord::Schema.define(version: 20130626181841) do

  create_table "campaigns", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", force: true do |t|
    t.string   "spreadsheet"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "documents", ["campaign_id"], name: "index_documents_on_campaign_id"

  create_table "keywords", force: true do |t|
    t.string   "name"
    t.decimal  "cost_per_click", precision: 8, scale: 2
    t.decimal  "clicks_per_day", precision: 8, scale: 2
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "keywords", ["campaign_id"], name: "index_keywords_on_campaign_id"

  create_table "sheets", force: true do |t|
    t.string   "spreadsheet"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sheets", ["campaign_id"], name: "index_sheets_on_campaign_id"

end
