########################################
# Schema
########################################
# t.datetime "created_at",       null: false
# t.datetime "updated_at",       null: false
# t.string   "type"
# t.integer  "location_id"
# t.integer  "school_id"
# t.integer  "ministry_id"
# t.string   "name"
# t.string   "email"
# t.string   "phone_number"
# t.boolean  "is_text_enabled"
# t.boolean  "is_email_enabled"
########################################

class Person < ApplicationRecord

  belongs_to :location
  belongs_to :school
  belongs_to :ministry
end
