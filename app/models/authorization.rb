########################################
# Schema
########################################
# t.datetime "created_at",  null: false
# t.datetime "updated_at",  null: false
# t.string   "name"
# t.string   "description"
########################################

class Authorization < ApplicationRecord

  VALID_NAMES = {
    super: 'super',
    app_admin: 'app_admin',
    app_event: 'app_event'
  }

end
