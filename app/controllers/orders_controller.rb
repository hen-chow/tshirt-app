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
    @cart = current_cart
    # user_id = @current_user.id
    @order = Order.create(clean_params.merge(user_id: session[:user_id]))
    # order_id = @order.id
    @order.add_line_items_from_cart(current_cart) #, order_id)

    # @order = Order.create(clean_params)

    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      # flash[:notice] = "Thanks for your order."

      redirect_to new_charge_path(order_id: @order.id)
    else
      @cart = current_cart
      flash[:error] = "Something went wrong. Please try again."

      render action: "new"
    end
  end

  private

  def clean_params
    params.require(:order).permit(:delivery_address, :pay_type, :delivery_type)
  end
end
