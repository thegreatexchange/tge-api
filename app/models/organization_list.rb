# == Schema Information
#
# Table name: organization_lists
#
#  id                :integer          not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  organization_id   :integer
#  mailchimp_list_id :string
#

class OrganizationList < ApplicationRecord

  belongs_to :organization

  validates :mailchimp_list_id, presence: true,
                                uniqueness: { scope: :organization_id }

end
