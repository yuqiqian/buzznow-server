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

ActiveRecord::Schema.define(version: 20160312020038) do

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "subcategories_id"
    t.integer  "supercategory_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "categories", ["subcategories_id"], name: "index_categories_on_subcategories_id"
  add_index "categories", ["supercategory_id"], name: "index_categories_on_supercategory_id"

  create_table "payment_transactions", force: :cascade do |t|
    t.integer  "requester_id"
    t.integer  "helper_id"
    t.datetime "payment_time"
    t.decimal  "amount"
    t.integer  "payment_method_id"
    t.integer  "transaction_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "payment_transactions", ["helper_id"], name: "index_payment_transactions_on_helper_id"
  add_index "payment_transactions", ["payment_method_id"], name: "index_payment_transactions_on_payment_method_id"
  add_index "payment_transactions", ["requester_id"], name: "index_payment_transactions_on_requester_id"

  create_table "payments", force: :cascade do |t|
    t.integer  "user_profile_id"
    t.integer  "card_last_four_digit"
    t.text     "billing_address"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "payments", ["user_profile_id"], name: "index_payments_on_user_profile_id"

  create_table "product_items", force: :cascade do |t|
    t.integer  "product_id"
    t.decimal  "quantity"
    t.boolean  "is_bought"
    t.integer  "shoplist_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "product_items", ["product_id"], name: "index_product_items_on_product_id"
  add_index "product_items", ["shoplist_id"], name: "index_product_items_on_shoplist_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "product_img"
    t.decimal  "price"
    t.string   "nutrition"
    t.integer  "brand_id"
    t.integer  "category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "super_markets_id"
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id"
  add_index "products", ["category_id"], name: "index_products_on_category_id"
  add_index "products", ["super_markets_id"], name: "index_products_on_super_markets_id"

  create_table "products_super_markets", id: false, force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "super_market_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "shoplists", force: :cascade do |t|
    t.integer  "requester_id"
    t.integer  "helper_id"
    t.string   "supermarket"
    t.datetime "expire_time"
    t.decimal  "total_price"
    t.decimal  "actual_price"
    t.string   "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "receipt"
  end

  add_index "shoplists", ["helper_id"], name: "index_shoplists_on_helper_id"
  add_index "shoplists", ["requester_id"], name: "index_shoplists_on_requester_id"

  create_table "super_markets", force: :cascade do |t|
    t.text     "name"
    t.integer  "products_id"
    t.text     "picture"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "super_markets", ["products_id"], name: "index_super_markets_on_products_id"

  create_table "user_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "address"
    t.string   "password"
    t.string   "profile_img_url"
    t.integer  "payments_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "user_profiles", ["payments_id"], name: "index_user_profiles_on_payments_id"
  add_index "user_profiles", ["user_id"], name: "index_user_profiles_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "gt_id"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_profile_id"
    t.string   "avatar"
  end

  add_index "users", ["user_profile_id"], name: "index_users_on_user_profile_id"

end
