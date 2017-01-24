# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  name                  :string
#  email                 :string
#  encrypted_password    :string
#  encrypted_password_iv :string
#

require 'encryption'
class User < ApplicationRecord

  has_many :user_authorizations, dependent: :destroy
  has_many :authorizations, through: :user_authorizations

  attr_encrypted :password, key: Encryption.key_for(:user_password)

  validates_uniqueness_of :email

  def active_authorizations
    user_authorizations.joins(:authorization).where(is_active: true).map &:authorization
  end

end
