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
   
 end

end
