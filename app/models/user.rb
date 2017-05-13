class User < ApplicationRecord
  has_many :orders
  has_many :designs
  has_one :cart
  validates_uniqueness_of :email, :case_sensitive => false, :with => /.+@.+\..+/i
  has_secure_password

end
