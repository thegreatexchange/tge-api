# == Schema Information
#
# Table name: people
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  name             :string
#  email            :string
#  phone_number     :string
#  is_text_enabled  :boolean
#  is_email_enabled :boolean
#

class Person < ApplicationRecord

  belongs_to :organization
  has_many   :event_registrations, dependent: :destroy
  has_many   :events, through: :event_registrations
  has_many   :organization_memberships, dependent: :destroy
  has_many   :organizations, through: :organization_memberships

  validates :name,         presence:   true
  validates :email,        presence:   true,
                           uniqueness: true,
                           format: {
                             with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                             if: :_allow_email_format_validation?
                           }
  validates :phone_number, format: {
                             with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/,
                             if: :_allow_phone_number_format_validation?
                           }

  private

  def _allow_email_format_validation?
    email.present?
  end

  def _allow_phone_number_format_validation?
    phone_number.present?
  end
end
