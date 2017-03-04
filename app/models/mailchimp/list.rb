# == Schema Information
#
# Table name: mailchimp_lists
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :integer
#  mailchimp_id    :string
#  name            :string
#

class Mailchimp::List < ApplicationRecord

  belongs_to :organization

  validates :mailchimp_id, presence: true,
                           uniqueness: { scope: :organization_id }

  validates :name,         presence: true,
                           uniqueness: { scope: :organization_id }

end
