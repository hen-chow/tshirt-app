class LineItemsController < ApplicationController

  def create
    @cart = current_cart
  end

end
