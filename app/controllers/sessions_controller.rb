class SessionsController < ApplicationController
  def new

        # raise 'he(n)ll'

  end

  def create

    user = User.find_by_email(params[:email])
    if user
      if user.authenticate(params[:password])
        # we have a real user
        session[:user_id] = user.id
        flash[:success] = "User signed in"
        if session[:redirect_to_order]
          # if user was redirected to signin from the order#new page, send them back there
          session.delete :redirect_to_order
          redirect_to new_order_path
        else
          # standard login
          redirect_to root_path
        end

      else
        render :new
      end
    else
      flash[:error] = "Wrong email or password. Please try again"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "You have successfully signed out"
    redirect_to root_path
  end
end
