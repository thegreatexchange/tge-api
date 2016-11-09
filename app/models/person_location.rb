########################################
# Schema
########################################
# t.datetime "created_at",                 null: false
# t.datetime "updated_at",                 null: false
# t.integer  "person_id"
# t.integer  "location_id"
# t.boolean  "is_active",   default: true
########################################

class PersonLocation < ApplicationRecord

  belongs_to :person
  belongs_to :location

end
