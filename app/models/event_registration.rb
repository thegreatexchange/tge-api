# == Schema Information
#
# Table name: event_registrations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#  person_id  :integer
#  comments   :text
#

class EventRegistration < ApplicationRecord

  belongs_to :event
  belongs_to :person

end
