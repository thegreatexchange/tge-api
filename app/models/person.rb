########################################
# Schema
########################################
# t.datetime "created_at",            null: false
# t.datetime "updated_at",            null: false
# t.string   "type"
# t.integer  "organization_id"
# t.string   "name"
# t.string   "email"
# t.string   "phone_number"
# t.text     "registration_comments"
# t.boolean  "is_text_enabled"
# t.boolean  "is_email_enabled"
########################################

class Person < ApplicationRecord

  belongs_to :organization
  has_many   :person_locations, dependent: :destroy
  has_many   :locations, through: :person_locations
  has_many   :event_registrations, dependent: :destroy
  has_many   :events, through: :event_registrations

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
