class LineItemsController < ApplicationController

  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id) # telling it to call the add_product method in the cart model

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart } # notice: 'Line item was successfully created.'
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

end
