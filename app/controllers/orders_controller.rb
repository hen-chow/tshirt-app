class OrdersController < ApplicationController
  #before_action :authenticate_user, only: [:create]

  def new

    if @current_user.nil?

      session[:redirect_to_order] = true
      flash[:error] = "Please login before completing your order."

      redirect_to signin_path
    end


    @order = Order.new
    @current_user = fetch_user

    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to store_url, notice: "Your shopping cart is empty"
    end
  end

  def create
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(current_cart)

    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to store_url, notice: "Thanks for your order"
    else
      @cart = current_cart
      render action: "new", notice: "Something went wrong. Please try again"
    end
  end

end
