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

require 'test_helper'

class Mailchimp::ListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
