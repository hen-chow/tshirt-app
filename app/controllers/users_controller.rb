class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
      @user = User.find(params[:id])
      if @user
        render action: :show
      else
        redirect_to root_path
      end
  end

  def create
    @user = User.new(clean_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Your account has been created"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def clean_params
    params.require(:user).permit(:email, :password, :name)
  end
end
