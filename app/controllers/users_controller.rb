class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "You have successfully created a new account."
      redirect_to dashboard_path(id: @user.id)
    else
      flash.now[:failure] = "Invalid login."
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
