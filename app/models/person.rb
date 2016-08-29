########################################
# Schema
########################################
# t.datetime "created_at",   null: false
# t.datetime "updated_at",   null: false
# t.string   "name"
# t.string   "email"
# t.string   "phone_number"
# t.string   "location"
########################################

class Person < ApplicationRecord

  has_many :sent_messages, class_name: 'Message'
  has_many :received_messages, through: :recipients, source: :message
  has_many :recipients

end
