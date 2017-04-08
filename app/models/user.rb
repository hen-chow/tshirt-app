class User < ApplicationRecord
  has_many :orders
  has_many :designs
  has_one :cart
  has_secure_password

end
