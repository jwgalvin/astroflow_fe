class User < ApplicationRecord
  validates_presence_of :email
  validates_presence_of :name
  validates_presence_of :zodiac_sign
end
