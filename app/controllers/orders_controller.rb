class OrdersController < ApplicationController

 def index
   if current_user
     @orders = current_user.orders
   else
     flash[:failure] = "Please log in or create an account."
     redirect_to login_path
   end
 end

end
