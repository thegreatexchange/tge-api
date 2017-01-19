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
########################################

class Event < ApplicationRecord

  belongs_to :location
  belongs_to :organization

  def name
    "#{organization.name} - #{starts_at.to_date}"
  end

end
