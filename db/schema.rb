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

  create_table "locations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "country"
    t.string   "state"
    t.string   "city"
  end

  create_table "ministries", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "location_id"
    t.integer  "school_id"
    t.string   "name"
    t.index ["location_id"], name: "index_ministries_on_location_id", using: :btree
    t.index ["school_id"], name: "index_ministries_on_school_id", using: :btree
  end

  create_table "people", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "type"
    t.integer  "location_id"
    t.integer  "school_id"
    t.integer  "ministry_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.boolean  "is_text_enabled"
    t.boolean  "is_email_enabled"
    t.index ["location_id"], name: "index_people_on_location_id", using: :btree
    t.index ["ministry_id"], name: "index_people_on_ministry_id", using: :btree
    t.index ["school_id"], name: "index_people_on_school_id", using: :btree
  end

  create_table "schools", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "location_id"
    t.string   "name"
    t.index ["location_id"], name: "index_schools_on_location_id", using: :btree
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
