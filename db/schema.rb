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

ActiveRecord::Schema.define(version: 20160710193314) do

  create_table "list_stocks", force: :cascade do |t|
    t.string   "name"
    t.string   "market"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_stocks", force: :cascade do |t|
    t.string   "symbol"
    t.date     "purchase_date"
    t.decimal  "purchase_price",            precision: 12, scale: 2, default: 0.0
    t.decimal  "purchase_commission",       precision: 12, scale: 2, default: 0.0
    t.decimal  "purchase_market_right",     precision: 12, scale: 2, default: 0.0
    t.date     "sale_date"
    t.decimal  "sale_price",                precision: 12, scale: 2, default: 0.0
    t.decimal  "sale_market_right",         precision: 12, scale: 2, default: 0.0
    t.integer  "user_id"
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.decimal  "sale_commission",           precision: 12, scale: 2, default: 0.0
    t.integer  "quantity",                                           default: 0
    t.decimal  "purchase_market_right_iva", precision: 12, scale: 2, default: 0.0
    t.decimal  "sale_market_right_iva",     precision: 12, scale: 2, default: 0.0
    t.decimal  "purchase_commission_iva",   precision: 12, scale: 2, default: 0.0
    t.decimal  "sale_commission_iva",       precision: 12, scale: 2, default: 0.0
    t.integer  "type_stock"
  end

  create_table "rate_charts", force: :cascade do |t|
    t.date     "since"
    t.date     "until"
    t.decimal  "commission",       precision: 12, scale: 2
    t.decimal  "commission_iva",   precision: 12, scale: 2
    t.decimal  "market_right",     precision: 12, scale: 2
    t.decimal  "market_right_iva", precision: 12, scale: 2
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "user_id"
    t.integer  "type_stock"
    t.decimal  "commission_min",   precision: 12, scale: 2
  end

  create_table "stocks", force: :cascade do |t|
    t.string   "symbol"
    t.date     "date"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.decimal  "open_price",  precision: 12, scale: 2
    t.decimal  "close_price", precision: 12, scale: 2
    t.decimal  "day_low",     precision: 12, scale: 2
    t.decimal  "day_high",    precision: 12, scale: 2
    t.decimal  "day_price",   precision: 12, scale: 2
    t.decimal  "volume",      precision: 12, scale: 2
  end

  add_index "stocks", ["symbol", "date"], name: "index_stocks_on_symbol_and_date"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
