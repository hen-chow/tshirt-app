class LineItemsController < ApplicationController

  def new
    @line_item = LineItem.new
  end

  def create
    @cart = current_cart
    product = Product.find_by(colour: params[:colour], size: params[:size])
    design = Design.find(params[:design_id])


    # @line_item = @cart.add_product(product.id, design.id, params[:qty], @cart.id) # telling it to call the add_product method in the cart model
    @line_item = LineItem.create(cart_id: @cart.id, product_id: product.id, design_id: design.id, qty: params[:qty], top: params[:top], left: params[:left], width_ratio: params[:width_ratio], height_ratio: params[:height_ratio])

    # @line_item = LineItem.create(clean_params.merge(cart_id: @cart.id))

    if @line_item.save
      redirect_to cart_path(id: @cart.id)  # notice: 'Line item was successfully created.'
    else
      redirect_to store_url
    end
  end

  def update
    @line_item = LineItem.find(params[:id])
    @line_item.update_attributes(clean_params)
    respond_to do |format|
      format.html do
        redirect_to cart_path(id: @cart.id)
      end
      format.json do
        render message: "Item updated"
      end
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    respond_to do |format|
      if current_cart.line_items.empty?
        format.html do
          redirect_to store_url
          flash[:notice] = 'Your cart is empty.'
        end
      else
        format.html do
          redirect_to cart_path(id: @cart.id)
          flash[:success] = 'Item was successfully removed.'
        end
      end
      format.json do
        head :ok
      end
    end
  end

  private

  def clean_params
    params.require(:line_item).permit(:product_id, :design_id, :qty, :cart_id, :order_id, :top, :left, :width_ratio, :height_ratio)
  end
end
