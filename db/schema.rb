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

ActiveRecord::Schema.define(version: 2019_08_01_161338) do

  create_table "categories", force: :cascade do |t|
    t.integer "parent_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_categories_on_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "category_id"
    t.string "url"
    t.string "name"
    t.integer "price"
    t.string "currency_id"
    t.string "avaliable"
    t.string "picture"
    t.string "store"
    t.text "pickup"
    t.string "delivery"
    t.integer "local_delivery_cost"
    t.string "vendor"
    t.string "model"
    t.text "description"
    t.text "sales_notes"
    t.string "manufacturer_warranty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_items_on_id"
    t.index ["name"], name: "index_items_on_name"
  end

end
