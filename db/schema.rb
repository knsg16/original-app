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

ActiveRecord::Schema.define(version: 20180919052008) do

  create_table "companies", primary_key: "company_id", force: :cascade do |t|
    t.string   "company_name",          limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "office_name",           limit: 255
    t.string   "contact_person",        limit: 255
    t.string   "email",                 limit: 255
    t.string   "tel",                   limit: 255
    t.string   "postcode",              limit: 255
    t.string   "address_prefecture",    limit: 255
    t.string   "address_city",          limit: 255
    t.text     "address_street_number", limit: 65535
    t.text     "address_after",         limit: 65535
  end

  create_table "contracts", force: :cascade do |t|
    t.integer  "company_id",      limit: 4
    t.integer  "plan_id",         limit: 4
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.date     "applicated_date"
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer  "contract_id",     limit: 4
    t.date     "schedule_date"
    t.datetime "maintenanced_at"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "delivery_items", force: :cascade do |t|
    t.integer  "delivery_id", limit: 4
    t.integer  "item_id",     limit: 4
    t.integer  "amount",      limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "delivery_items", ["delivery_id"], name: "index_delivery_items_on_delivery_id", using: :btree
  add_index "delivery_items", ["item_id"], name: "index_delivery_items_on_item_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "price",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "plans", primary_key: "plan_id", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.integer  "price",                limit: 4
    t.integer  "month_quantity_limit", limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "once_quantity_limit",  limit: 4
    t.integer  "month_delivery_limit", limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "authority",              limit: 4,   default: 0
    t.string   "username",               limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "delivery_items", "deliveries"
  add_foreign_key "delivery_items", "items"
end
