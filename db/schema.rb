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

ActiveRecord::Schema.define(version: 20170502172732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email",           default: "", null: false
    t.string "password_digest", default: "", null: false
    t.string "firstname",       default: "", null: false
    t.string "lastname",        default: "", null: false
    t.string "avatar",          default: "", null: false
    t.string "photo",           default: "", null: false
    t.date   "birth_date"
  end

  create_table "guests", force: :cascade do |t|
    t.string "email",           default: "", null: false
    t.string "password_digest", default: "", null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string "email",           default: "", null: false
    t.string "password_digest", default: "", null: false
    t.string "avatar",          default: "", null: false
    t.string "shop",            default: "", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "shop"
    t.boolean  "is_pro",      default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
