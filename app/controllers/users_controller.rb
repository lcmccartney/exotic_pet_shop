class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    if current_user
      @user = current_user
    else
      flash[:danger] = "Please log in or create an account."
      redirect_to login_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      UserNotifier.send_signup_email(@user).deliver if @user.email.present?
      flash[:success] = "You have successfully created a new account."
      redirect_to cart_path if @cart.contents.any?
      redirect_to dashboard_path if @cart.contents.empty?
    else
      flash.now[:danger] = "Invalid login."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
