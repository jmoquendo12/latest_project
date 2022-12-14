# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_13_053616) do
  create_table "address_barangays", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.bigint "city_municipality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_municipality_id"], name: "index_address_barangays_on_city_municipality_id"
  end

  create_table "address_city_municipalities", charset: "utf8mb4", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.bigint "province_id"
    t.bigint "district_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["district_id"], name: "index_address_city_municipalities_on_district_id"
    t.index ["province_id"], name: "index_address_city_municipalities_on_province_id"
  end

  create_table "address_provinces", charset: "utf8mb4", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_address_provinces_on_region_id"
  end

  create_table "address_regions", charset: "utf8mb4", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "street_address"
    t.string "phone_number"
    t.boolean "is_default"
    t.string "remark"
    t.bigint "user_id"
    t.bigint "address_region_id"
    t.bigint "address_province_id"
    t.bigint "address_city_municipality_id"
    t.bigint "address_barangay_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "genre"
    t.index ["address_barangay_id"], name: "index_addresses_on_address_barangay_id"
    t.index ["address_city_municipality_id"], name: "index_addresses_on_address_city_municipality_id"
    t.index ["address_province_id"], name: "index_addresses_on_address_province_id"
    t.index ["address_region_id"], name: "index_addresses_on_address_region_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "admin_category_ships", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "admin_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_admin_category_ships_on_admin_id"
    t.index ["category_id"], name: "index_admin_category_ships_on_category_id"
  end

  create_table "admins", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "items", charset: "utf8mb4", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.integer "quantity"
    t.integer "minimum_bets"
    t.integer "batch_count"
    t.integer "status"
    t.string "state"
    t.datetime "online_at"
    t.datetime "offline_at"
    t.datetime "start_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "members", charset: "utf8mb4", force: :cascade do |t|
    t.string "username"
    t.string "address"
    t.integer "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.string "username"
    t.string "image"
    t.string "phone"
    t.string "address"
    t.bigint "parent_id"
    t.integer "children_member"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["parent_id"], name: "index_users_on_parent_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
