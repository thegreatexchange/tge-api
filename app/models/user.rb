require 'encryption'
########################################
# Schema
########################################
# t.datetime "created_at",            null: false
# t.datetime "updated_at",            null: false
# t.string   "name"
# t.string   "email"
# t.string   "encrypted_password"
# t.string   "encrypted_password_iv"
########################################

class User < ApplicationRecord

  has_many :user_authorizations, dependent: :destroy
  has_many :authorizations, through: :user_authorizations

  attr_encrypted :password, key: Encryption.key_for(:user_password)

  validates_uniqueness_of :email

end
