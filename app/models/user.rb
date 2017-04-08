class User < ApplicationRecord
  has_many :orders
  has_many :designs
  has_one :cart
end
