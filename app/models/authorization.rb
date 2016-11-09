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
    super: 'super'
  }

end
