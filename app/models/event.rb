# == Schema Information
#
# Table name: events
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  location_id     :integer
#  organization_id :integer
#  starts_at       :datetime
#  ends_at         :datetime
#  description     :text
#  name            :string
#

class Event < ApplicationRecord

  belongs_to :location
  belongs_to :organization

  validates :name, uniqueness: true,
                   presence:   true
  # validates :starts_at, presence: true

end
