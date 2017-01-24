# == Schema Information
#
# Table name: user_authorizations
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#  authorization_id :integer
#  is_active        :boolean          default(TRUE)
#

require 'test_helper'

class UserAuthorizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
