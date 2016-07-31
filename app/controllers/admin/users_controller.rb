class Admin::UsersController < Admin::BaseController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(admin_params)
      redirect_to admin_dashboard_path
    else
      flash.now[:error] = "Try again"
      render :edit
    end
  end

  private

  def admin_params
    params.require(:user).permit(:username, :password)
  end
end
