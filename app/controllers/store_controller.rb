class StoreController < ApplicationController

  def index
    @products = Product.all
    @cart = current_cart

    if @current_user
      @designs = Design.where(predesign: true)
      @user_designs = Design.where(predesign: false, user_id: @current_user.id)
    else
      @designs = Design.where(predesign: true)
    end
  end

end
