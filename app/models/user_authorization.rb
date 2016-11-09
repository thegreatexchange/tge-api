########################################
# Schema
########################################
# t.datetime "created_at",                      null: false
# t.datetime "updated_at",                      null: false
# t.integer  "user_id"
# t.integer  "authorization_id"
# t.boolean  "is_active",        default: true
########################################

class UserAuthorization < ApplicationRecord

  belongs_to :user
  belongs_to :authorization

end
