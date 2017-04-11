class StoreController < ApplicationController

  SIZE_CONST = ["S", "M", "L"]

  def index
    @products = Product.all
    @product = Product.find_by(colour: "white", size: "S")
    @designs = Design.order(:name)
    @sizes = SIZE_CONST
    @cart = current_cart
  end

end
