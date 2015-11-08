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

ActiveRecord::Schema.define(version: 20151108124814) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "contact_email"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "invoices", force: :cascade do |t|
    t.integer  "rentable_id"
    t.date     "due"
    t.boolean  "paid"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.decimal  "gas_usage"
    t.decimal  "gas_price"
    t.decimal  "gas"
  end

  add_index "invoices", ["rentable_id"], name: "index_invoices_on_rentable_id", using: :btree

  create_table "rentables", force: :cascade do |t|
    t.integer  "category"
    t.string   "city"
    t.string   "street"
    t.string   "zip"
    t.text     "inventory"
    t.integer  "admin_id"
    t.string   "account_number"
    t.string   "transfer_address"
    t.string   "transfer_title"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "pass_code"
    t.string   "transfer_person"
  end

  add_index "rentables", ["admin_id"], name: "index_rentables_on_admin_id", using: :btree

  create_table "user_invoices", force: :cascade do |t|
    t.integer  "invoice_id"
    t.integer  "user_id"
    t.decimal  "rent"
    t.decimal  "trash"
    t.decimal  "heating"
    t.decimal  "upkeep"
    t.decimal  "power"
    t.decimal  "power_price"
    t.float    "power_usage"
    t.decimal  "water"
    t.decimal  "hot_water_price"
    t.float    "hot_water_usage"
    t.decimal  "cold_water_price"
    t.float    "cold_water_usage"
    t.string   "other_name"
    t.decimal  "other_sum"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.decimal  "gas_usage",        default: 0.0
    t.decimal  "gas_price",        default: 0.0
    t.decimal  "gas",              default: 0.0
  end

  add_index "user_invoices", ["invoice_id"], name: "index_user_invoices_on_invoice_id", using: :btree
  add_index "user_invoices", ["user_id"], name: "index_user_invoices_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "rentable_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["rentable_id"], name: "index_users_on_rentable_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "invoices", "rentables"
  add_foreign_key "rentables", "admins"
  add_foreign_key "user_invoices", "invoices"
  add_foreign_key "user_invoices", "users"
  add_foreign_key "users", "rentables"
end
