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

ActiveRecord::Schema.define(version: 20150805194720) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "business_id"
    t.string   "street_number"
    t.string   "unit_number"
    t.string   "street_name"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "businesses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "category"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "photo"
    t.text     "description"
    t.boolean  "featured"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "layouts", force: :cascade do |t|
    t.integer  "business_id"
    t.string   "template"
    t.string   "main_color"
    t.string   "secondary_color"
    t.string   "accent_color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "password_digest"
    t.string   "photo"
    t.string   "type",            default: "customer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
