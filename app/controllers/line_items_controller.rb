class LineItemsController < ApplicationController

  def new
    @line_item = LineItem.new
  end

  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    design = Design.find(params[:design_id])

    # @line_item = @cart.add_product(product.id, design.id, params[:qty], @cart.id) # telling it to call the add_product method in the cart model
    line_item = LineItem.create(cart_id: @cart.id, product_id: product.id, design_id: design.id, qty: params[:qty], top: params[:top], left: params[:left], width_ratio: params[:width_ratio], height_ratio: params[:height_ratio])

    # respond_to do |format|
    #   if line_item.save
    #     format.html { redirect_to cart_path(id: @cart.id) } # notice: 'Line item was successfully created.'
    #     format.json { render :show, status: :created, location: line_item }
    #   else
    #     format.html { render :new }
    #     format.json { render json: line_item.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def update
    @line_item = LineItem.find(params[:id])
    @line_item.update_attributes(clean_params)
    respond_to do |format|
      format.html { redirect_to cart_path(id: current_cart.id) }
      format.json { render message: "Item updated"}
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    respond_to do |format|
      if current_cart.line_items.empty?
        format.html { redirect_to store_url, notice: 'Your cart is empty.' }
      else
        format.html { redirect_to cart_path(id: current_cart.id), notice: 'Item was successfully removed.' }
      end
      format.json { head :ok }
    end
  end

  private

  def clean_params
    params.require(:line_item).permit(:product_id, :design_id, :qty, :cart_id, :order_id, :top, :left, :width_ratio, :height_ratio)
  end
end
