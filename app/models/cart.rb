class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy

  def add_product (product_id) # method to check whether list of items already incl the prod we're adding. if it does, it increases the qty, if it doesn't, it creates a new line_item
    current_item = line_items.find_by_product_id(product_id) # use find_by_product_id method in ActiveRecord to search
    if current_item
      current_item.qty += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end

  def total_price # add method to sum up items in cart
    line_items.to_a.sum { |item| item.total_price }
  end
end
