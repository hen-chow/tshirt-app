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

ActiveRecord::Schema.define(version: 20170412055633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "designs", force: :cascade do |t|
    t.string   "name"
    t.integer  "length"
    t.integer  "width"
    t.string   "img_src"
    t.boolean  "predesign",  default: true
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "design_id"
    t.integer  "qty",          default: 1
    t.integer  "cart_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "order_id"
    t.integer  "top"
    t.integer  "left"
    t.decimal  "width_ratio"
    t.decimal  "height_ratio"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "delivery_address"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "pay_type"
    t.string   "delivery_type"
  end

  create_table "products", force: :cascade do |t|
    t.string   "colour"
    t.string   "size"
    t.decimal  "price",       precision: 8, scale: 2
    t.integer  "stock_level"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "img_src"
    t.string   "thumbnail"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
