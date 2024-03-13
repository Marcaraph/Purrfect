class UsersController < ApplicationController
  def show
    
  end

  def index
  end

  def destroy
    user = User.find(current_user.id)
    # user.cart.destroy
    # user.order.destroy
    user.destroy
    redirect_to root_path
  end
end
