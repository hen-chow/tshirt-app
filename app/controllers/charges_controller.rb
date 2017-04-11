class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @total_price = number_to_currency @cart.total_price
    @amount = dollars_to_cents @total_price

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
