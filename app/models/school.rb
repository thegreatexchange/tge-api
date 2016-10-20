########################################
# Schema
########################################
# t.datetime "created_at",  null: false
# t.datetime "updated_at",  null: false
# t.integer  "location_id"
# t.string   "name"
########################################

class School < ApplicationRecord

  belongs_to :location
  has_many   :ministries

end
