class SessionsController < ApplicationController
  def new

  end

  def create

    user = User.find_by_email(params[:email])
    if user
      if user.authenticate(params[:password])
        # we have a real user
        session[:user_id] = user.id

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
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
