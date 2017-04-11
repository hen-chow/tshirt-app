class StoreController < ApplicationController

  def index
    @products = Product.all
    @designs = Design.order(:name)
    @cart = current_cart
  end

end
