class StoreController < ApplicationController

  SIZE_CONST = ["S", "M", "L"]

  def index
    @products = Product.all
    @designs = Design.order(:name)
    @sizes = SIZE_CONST
  end

end
