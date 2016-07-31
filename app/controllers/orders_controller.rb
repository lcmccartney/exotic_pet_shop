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
    if current_user
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

    @cart.cart_animals.each do |animal_order|
      order.order_animals.create(
        order_id: order.id,
        animal_id: animal_order.id,
        subtotal: animal_order.subtotal,
        quantity: animal_order.quantity
      )
    end
    @cart.contents.clear
    flash[:success] = "Order was successfully placed"
    redirect_to order_path(order)
  end

end
