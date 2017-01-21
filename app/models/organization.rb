# == Schema Information
#
# Table name: organizations
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  location_id :integer
#  name        :string
#

class Organization < ApplicationRecord

  belongs_to :location
  has_many   :ministries

  validates :name, presence:   true,
                   uniqueness: true
end
