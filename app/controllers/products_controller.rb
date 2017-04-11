class ProductsController < ApplicationController
  before_action :authenticate_user, only: [:create, :new, :index]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(clean_params)
    if @product.save
      redirect_to new_product_path
    end
  end

  # def show
  #   @products = Product.all
  # end
  #
  # def updated
  # end
  #
  # def edit
  #
  # end
  #
  # def destroy
  #
  # end

  private

  def clean_params
    params.require(:product).permit(:name, :description, :img_src, :price, :stock_level)
  end

end
