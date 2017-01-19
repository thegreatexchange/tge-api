########################################
# Schema
########################################
# t.datetime "created_at",  null: false
# t.datetime "updated_at",  null: false
# t.integer  "location_id"
# t.integer  "organization_id"
# t.datetime "starts_at"
# t.datetime "ends_at"
# t.text     "description"
# t.string   "name"
########################################

class Event < ApplicationRecord

  belongs_to :location
  belongs_to :organization

  validates :name, uniqueness: true,
                   presence:   true
  validates :starts_at, presence: true

end
