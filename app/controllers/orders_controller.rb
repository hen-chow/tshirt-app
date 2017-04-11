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
      flash[:notice] = "Your shopping cart is empty."

      redirect_to root_path
    end
  end

  def create
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(current_cart)

    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      flash[:notice] = "Thanks for your order."

      redirect_to root_path
    else
      @cart = current_cart
      flash[:error] = "Something went wrong. Please try again."

      render action: "new"
    end
  end

end
