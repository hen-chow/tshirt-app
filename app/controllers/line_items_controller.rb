class LineItemsController < ApplicationController

  def index
    @line_itmes = LineItem.all
  end

  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    design = Design.find(params[:design_id])

    # @line_item = @cart.add_product(product.id, design.id, params[:qty], @cart.id) # telling it to call the add_product method in the cart model
    line_item = LineItem.create(cart_id: @cart.id, product_id: product.id, design_id: design.id, qty: params[:qty], top: params[:top], left: params[:left], width_ratio: params[:width_ratio], height_ratio: params[:height_ratio])

    # respond_to do |format|
    #   if @line_item.save
    #     format.html { redirect_to @line_item.cart } # notice: 'Line item was successfully created.'
    #     format.json { render :show, status: :created, location: @line_item }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @line_item.errors, status: :unprocessable_entity }
    #   end
    # end
  end

end
