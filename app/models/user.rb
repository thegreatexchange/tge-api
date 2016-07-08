class User < ApplicationRecord

  validates_uniqueness_of :email
  validates_presence_of   :password
  
end
