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

ActiveRecord::Schema.define(version: 20160708020928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "notifications", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "sent_at"
    t.integer  "sent_by_id"
    t.string   "sent_to_type"
    t.integer  "sent_to_id"
    t.json     "data"
    t.index ["sent_by_id"], name: "index_notifications_on_sent_by_id", using: :btree
    t.index ["sent_to_type", "sent_to_id"], name: "index_notifications_on_sent_to_type_and_sent_to_id", using: :btree
  end

  create_table "people", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "location"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "super",                 default: false
    t.string   "name"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "encrypted_password_iv"
    t.index ["email"], name: "index_users_on_email", using: :btree
  end

end
