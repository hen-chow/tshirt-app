class StoreController < ApplicationController

  def index
    @products = Product.order(:name)
    @designs = Design.order(:name)
  end

end
