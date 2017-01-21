# == Schema Information
#
# Table name: organization_memberships
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :integer
#  person_id       :integer
#  is_primary      :boolean          default(FALSE)
#

class OrganizationMembership < ApplicationRecord

  belongs_to :organization
  belongs_to :person

  validates :organization_id, presence: true
  validates :person_id,       presence: true,
                              uniqueness: { scope: :organization_id }


end
