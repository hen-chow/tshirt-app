class StoreController < ApplicationController

  def index
    @products = Product.all
    @designs = Design.order(:name)
  end

end
