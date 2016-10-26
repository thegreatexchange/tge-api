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

  create_table "authorizations", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.string   "description"
  end

  create_table "locations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "region"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "zip"
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
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "type"
    t.integer  "school_id"
    t.integer  "ministry_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.text     "registration_comments"
    t.boolean  "is_text_enabled"
    t.boolean  "is_email_enabled"
    t.index ["ministry_id"], name: "index_people_on_ministry_id", using: :btree
    t.index ["school_id"], name: "index_people_on_school_id", using: :btree
  end

  create_table "person_locations", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "person_id"
    t.integer  "location_id"
    t.boolean  "is_active",   default: true
    t.index ["location_id"], name: "index_person_locations_on_location_id", using: :btree
    t.index ["person_id", "location_id"], name: "index_person_locations_on_person_id_and_location_id", using: :btree
    t.index ["person_id"], name: "index_person_locations_on_person_id", using: :btree
  end

  create_table "schools", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "location_id"
    t.string   "name"
    t.index ["location_id"], name: "index_schools_on_location_id", using: :btree
  end

  create_table "user_authorizations", force: :cascade do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "user_id"
    t.integer  "authorization_id"
    t.boolean  "is_active",        default: true
    t.index ["authorization_id"], name: "index_user_authorizations_on_authorization_id", using: :btree
    t.index ["user_id", "authorization_id"], name: "index_user_authorizations_on_user_id_and_authorization_id", using: :btree
    t.index ["user_id"], name: "index_user_authorizations_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "name"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "encrypted_password_iv"
    t.index ["email"], name: "index_users_on_email", using: :btree
  end

end
