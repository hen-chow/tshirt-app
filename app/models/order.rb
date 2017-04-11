class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items

  PAYMENT_TYPES = ["Credit Card", "PayPal"]
  DELIVERY_TYPES = ["Express Delivery", "Standard Delivery", "Postal Delivery"]
end
