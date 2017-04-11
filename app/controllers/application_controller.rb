class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :fetch_user

  private

  def fetch_user
    @current_user = User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def authenticate_user
    if @current_user.nil?
      respond_to do |format|
        format.html do
          flash[:error] = "Access denied"
          return redirect_to root_path
        end
        format.json do
          render json: {}, status: :unauthorized
        end
      end
    end
  end


  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

end
