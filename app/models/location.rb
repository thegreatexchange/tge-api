########################################
# Schema
########################################
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.string   "name"
# t.string   "country"
# t.string   "region"
# t.string   "state"
# t.string   "city"
# t.string   "zip"
# t.string   "address"
# t.string   "timezone"
########################################

class Location < ApplicationRecord

  has_many :schools
  has_many :ministries

end
