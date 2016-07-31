class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if current_admin?
        redirect_to admin_dashboard_path
      else
      redirect_to dashboard_path if @cart.contents.empty?
      redirect_to cart_path if !@cart.contents.empty?
      end
    else
      flash.now[:danger] = "Invalid login"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
