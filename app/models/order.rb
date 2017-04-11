class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items

  PAYMENT_TYPES = ["Credit Card", "PayPal"]
  DELIVERY_TYPES = ["Express Delivery", "Standard Delivery", "Postal Delivery"]

  def add_line_items_from_cart
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
