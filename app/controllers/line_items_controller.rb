class LineItemsController < ApplicationController

  def new
    @line_item = LineItem.new
  end

  def create
    @cart = current_cart
    product = Product.find_by(colour: params[:colour], size: params[:size])
    design = Design.find(params[:design_id])

    line_item = LineItem.create(cart_id: @cart.id, product_id: product.id, design_id: design.id, qty: params[:qty], top: params[:top], left: params[:left], width_ratio: params[:width_ratio], height_ratio: params[:height_ratio])

    @total_qty =  @cart.line_items.to_a.sum { |item| item.qty}

    if line_item.save
      flash[:success] = "Item was successfully added to your shopping cart."
      # redirect_to cart_path(id: @cart.id)  # notice: 'Line item was successfully created.'
      render json: @total_qty
    else
      redirect_to root_path
    end
  end

  def show
    @line_item = LineItem.find(params[:id])
    tshirtWidth = 400
    tshirtHeight = 382
    @new_width = @line_item.width_ratio * tshirtWidth
    @new_height = @line_item.height_ratio * tshirtHeight

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
          redirect_to root_path
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
