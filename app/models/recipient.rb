########################################
# Schema
########################################
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.integer  "message_id"
# t.integer  "person_id"
# t.index ["message_id"], name: "index_recipients_on_message_id", using: :btree
# t.index ["person_id"], name: "index_recipients_on_person_id", using: :btree
########################################
class Recipient < ApplicationRecord

  belongs_to :message
  belongs_to :person

end
