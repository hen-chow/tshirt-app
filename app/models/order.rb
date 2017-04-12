class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy

  PAYMENT_TYPES = ["Credit Card", "PayPal"]
  DELIVERY_TYPES = ["Express Delivery", "Standard Delivery", "Postal Delivery"]

  validates :delivery_address, :delivery_type, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  def add_line_items_from_cart (cart) #, order_id)
    # line_items = []
    cart.line_items.each do |item|
      item.cart_id = nil
      # item.order_id = order_id
      item.save
      puts "============================================="
      p item
      line_items << item
      # raise item
    end
    # raise 'hell'
  end
end
