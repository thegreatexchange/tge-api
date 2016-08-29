########################################
# Schema
########################################
# t.datetime "created_at",   null: false
# t.datetime "updated_at",   null: false
# t.datetime "sent_at"
# t.integer  "sent_by_id"
# t.string   "sent_to_type"
# t.integer  "sent_to_id"
# t.json     "data"
########################################

class Message < ApplicationRecord

  belongs_to :person
  has_many   :recipients, dependent: :destroy

end
