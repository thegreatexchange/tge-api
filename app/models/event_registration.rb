########################################
# Schema
########################################
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.integer  "event_id"
# t.integer  "person_id"
# t.text     "comments"
########################################

class EventRegistration < ApplicationRecord

  belongs_to :event
  belongs_to :person

end
