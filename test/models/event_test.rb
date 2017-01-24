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

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
