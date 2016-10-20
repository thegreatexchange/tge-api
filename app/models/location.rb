########################################
# Schema
########################################
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.string   "region"
# t.string   "country"
# t.string   "state"
# t.string   "city"
# t.string   "zip"
########################################

class Location < ApplicationRecord

  has_many :schools
  has_many :ministries

end
