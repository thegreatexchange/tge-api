require 'encryption'
########################################
# Schema
########################################
# t.datetime "created_at",                            null: false
# t.datetime "updated_at",                            null: false
# t.boolean  "super",                 default: false
# t.string   "name"
# t.string   "email"
# t.string   "encrypted_password"
# t.string   "encrypted_password_iv"
# t.index ["email"], name: "index_users_on_email", using: :btree
########################################

class User < ApplicationRecord

  attr_encrypted :password, key: Encryption.key_for(:user_password)

  validates_uniqueness_of :email

end
