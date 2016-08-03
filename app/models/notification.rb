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
# t.index ["sent_by_id"], name: "index_notifications_on_sent_by_id", using: :btree
# t.index ["sent_to_type", "sent_to_id"], name: "index_notifications_on_sent_to_type_and_sent_to_id", using: :btree
########################################

class Notification < ApplicationRecord

  belongs_to :sent_by, class_name: 'User'
  belongs_to :sent_to, polymorphic: true

end
