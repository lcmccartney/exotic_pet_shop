class OrdersController < ApplicationController

  def index
    if current_user
      @orders = current_user.orders
    else
      flash[:danger] = "Please log in or create an account."
      redirect_to login_path
    end
  end

  def show
    if current_user && current_user.orders.find_by(id: params[:id])
      @order = current_user.orders.find(params[:id])
    else
      flash[:danger] = "Please log in or create an account."
      redirect_to login_path
    end
  end

  def create
    order = Order.create(
      user_id: current_user.id,
      total_price: @cart.total_price
    )
    create_order(order)
    @cart.contents.clear
    flash[:success] = "Order was successfully placed"
    redirect_to order_path(order)
  end

private

  def create_order(order)
    OrderProcessor.new(order, @cart).add_animals_to_order
  end

end
