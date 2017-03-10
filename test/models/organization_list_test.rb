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

require 'test_helper'

class OrganizationListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
