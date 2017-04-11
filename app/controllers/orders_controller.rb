class OrdersController < ApplicationController

  def new
    @order = Order.new

    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to store_url, notice: "Your shopping cart is empty"
    end
  end

end
