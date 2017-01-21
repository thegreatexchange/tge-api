# == Schema Information
#
# Table name: authorizations
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :string
#  description :string
#

class Authorization < ApplicationRecord

  VALID_NAMES = {
    super: 'super',
    app_admin: 'app_admin',
    app_event: 'app_event'
  }

end
