require 'encryption'

class User < ApplicationRecord

  attr_encrypted :password, key: Encryption.key_for(:user_password)

  validates_uniqueness_of :email

end
