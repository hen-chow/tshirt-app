class OrdersController < ApplicationController

  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to store_url, notice: "Your shopping cart is empty"
    end
    @order = Order.new
  end

end
