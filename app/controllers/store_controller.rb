class StoreController < ApplicationController

  def index
    @products = Product.all
    @cart = current_cart

    @designs = Design.where(predesign: true)

    if @current_user
      @user_designs = Design.where(predesign: false, user_id: @current_user.id)
    end
  end

end
