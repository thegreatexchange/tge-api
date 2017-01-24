# == Schema Information
#
# Table name: people
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  name             :string
#  email            :string
#  phone_number     :string
#  is_text_enabled  :boolean
#  is_email_enabled :boolean
#

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
