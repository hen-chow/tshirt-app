class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :line_items, dependent: :destroy

  def add_product (product_id, design_id, qty, cart_id) # method to check whether list of items already incl the prod we're adding. if it does, it increases the qty, if it doesn't, it creates a new line_item
    current_item = line_items.find_by(product_id: (product_id), design_id: (design_id)) # use find_by_product_id method in ActiveRecord to search
    if current_item
      current_item.qty += qty
    else
      current_item = line_items.new(product_id: product_id, design_id: design_id, qty: qty, cart_id: cart_id)
    end
    current_item.save
  end

  def total_price # add method to sum up items in cart
    line_items.to_a.sum { |item| item.total_price }
  end
end
