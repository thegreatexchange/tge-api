########################################
# Schema
########################################
# t.datetime "created_at",  null: false
# t.datetime "updated_at",  null: false
# t.integer  "location_id"
# t.integer  "school_id"
# t.string   "name"
########################################

class Ministry < ApplicationRecord

  belongs_to :location
  belongs_to :school

end
