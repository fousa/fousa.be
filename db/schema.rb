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

ActiveRecord::Schema.define(version: 20150707140950) do

  create_table "apps", force: :cascade do |t|
    t.string   "name"
    t.string   "name_suffix"
    t.string   "short_text"
    t.string   "dashboard_image"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "slug"
    t.text     "text"
    t.text     "rendered_text"
    t.string   "url"
    t.string   "logo"
  end

  add_index "apps", ["slug"], name: "index_apps_on_slug", unique: true

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
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "document"
    t.boolean  "document_exists", default: false, null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "invoices", force: :cascade do |t|
    t.date     "invoiced_at"
    t.string   "name"
    t.decimal  "net_price"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "number"
    t.integer  "customer_id"
    t.decimal  "tax_percentage"
  end

  create_table "screenshots", force: :cascade do |t|
    t.string   "image"
    t.integer  "app_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
