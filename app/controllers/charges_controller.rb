class ChargesController < ApplicationController

  def new
    # raise
    session[:order_id] = params[:order_id]
    order = Order.find(params[:order_id])
    @total_price = order.line_items.to_a.sum { |item| item.total_price }
    @amount = dollars_to_cents(@total_price)

  end

  def create
    # Amount in cents
    order = Order.find(session[:order_id])
    @total_price = order.line_items.to_a.sum { |item| item.total_price }
    @amount = dollars_to_cents(@total_price)

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'aud'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

  def dollars_to_cents(dollars)
    (100 * dollars.to_r).to_i
  end
end
