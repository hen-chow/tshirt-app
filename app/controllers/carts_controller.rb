class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      flash[:error] = "Attempt to access invalid cart"
      redirect_to store_url
    # else
    #   # respond_to do |format|
    #   #   format.html do
    #       redirect_to cart_path(id: @cart.id)
    #     # end
    #     # format.json do
    #     #   render json: @cart
    #     # end
      # end
    end
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html do
          redirect_to @cart
          flash[:success] = 'Cart was successfully created.'
        end
        format.json do
          render :show, status: :created, location: @cart
        end
      else
        format.html do
          render :new
        end
        format.json do
          render json: @cart.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html do
          flash[:success] = 'Cart was successfully updated.'
          return redirect_to @cart
        end
        format.json do
          render json: {}, status: :ok, location: @cart
        end
      else
        format.html do
          render :edit
        end
        format.json do
          render json: @cart.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html do
        redirect_to store_url
        flash[:notice] = 'Your cart is currently empty.'
      end
      format.json do
        head :ok
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # only allow the white list through.
    def cart_params
      params.fetch(:cart, {})
    end
end
