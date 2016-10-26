########################################
# Schema
########################################
# t.datetime "created_at",  null: false
# t.datetime "updated_at",  null: false
# t.integer  "location_id"
# t.integer  "school_id"
# t.integer  "ministry_id"
# t.datetime "starts_at"
# t.datetime "ends_at"
# t.text     "description"
########################################

class Event < ApplicationRecord

  belongs_to :location
  belongs_to :school
  belongs_to :ministry

end
