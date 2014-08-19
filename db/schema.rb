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

ActiveRecord::Schema.define(version: 20140819233952) do

  create_table "areas", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "areas_service_centers", id: false, force: true do |t|
    t.integer "area_id",           null: false
    t.integer "service_center_id", null: false
  end

  create_table "budgets", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "certainties", force: true do |t|
    t.integer  "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales_forecasts", force: true do |t|
    t.integer  "service_center_id"
    t.integer  "segment_id"
    t.integer  "status_id"
    t.integer  "area_id"
    t.string   "company"
    t.string   "division"
    t.string   "customer_name"
    t.string   "instrument"
    t.integer  "price"
    t.integer  "budget_id"
    t.integer  "certainty_id"
    t.string   "reporting_date"
    t.string   "fixed_date"
    t.string   "order_date"
    t.string   "agent"
    t.text     "condition_text"
    t.string   "person_in_charge"
    t.boolean  "visible"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sales_forecasts", ["area_id"], name: "index_sales_forecasts_on_area_id", using: :btree
  add_index "sales_forecasts", ["budget_id"], name: "index_sales_forecasts_on_budget_id", using: :btree
  add_index "sales_forecasts", ["certainty_id"], name: "index_sales_forecasts_on_certainty_id", using: :btree
  add_index "sales_forecasts", ["segment_id"], name: "index_sales_forecasts_on_segment_id", using: :btree
  add_index "sales_forecasts", ["service_center_id"], name: "index_sales_forecasts_on_service_center_id", using: :btree
  add_index "sales_forecasts", ["status_id"], name: "index_sales_forecasts_on_status_id", using: :btree

  create_table "segments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_centers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: true do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
