# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#  country    :string
#  region     :string
#  state      :string
#  city       :string
#  zip        :string
#  address    :string
#  timezone   :string
#

class Location < ApplicationRecord

  has_many :organizations

end
