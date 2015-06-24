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

ActiveRecord::Schema.define(version: 20150624084804) do

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "postal_code"
    t.string   "city"
    t.string   "country"
    t.string   "vat_number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.date     "issued_at"
    t.text     "description"
    t.decimal  "total_price"
    t.decimal  "tax_price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "document"
  end

  create_table "invoices", force: :cascade do |t|
    t.date     "invoiced_at"
    t.string   "name"
    t.decimal  "total_price"
    t.decimal  "tax_price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "number"
    t.integer  "customer_id"
  end

end
