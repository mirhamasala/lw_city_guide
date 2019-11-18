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

ActiveRecord::Schema.define(version: 2019_11_17_085849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "cover"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities_users", id: false, force: :cascade do |t|
    t.bigint "city_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "score"
    t.bigint "user_id"
    t.bigint "spot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_ratings_on_spot_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "name"
    t.string "sub_category"
    t.text "description"
    t.string "address"
    t.string "neighborhood"
    t.float "latitude"
    t.float "longitude"
    t.string "phone_number"
    t.string "website"
    t.string "photo"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.bigint "owner_id"
    t.index ["category_id"], name: "index_spots_on_category_id"
    t.index ["city_id"], name: "index_spots_on_city_id"
    t.index ["owner_id"], name: "index_spots_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.string "github_username"
    t.string "provider"
    t.string "uid"
    t.string "github_picture_url"
    t.string "first_name"
    t.string "last_name"
    t.string "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ratings", "spots"
  add_foreign_key "ratings", "users"
  add_foreign_key "spots", "categories"
  add_foreign_key "spots", "cities"
end
