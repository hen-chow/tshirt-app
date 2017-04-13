module ApplicationHelper

  def total_number_of_items_in_cart
    @cart = current_cart
    @total_qty =  @cart.line_items.to_a.sum { |item| item.qty}
    @total_qty
  end
end
