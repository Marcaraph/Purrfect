class UsersController < ApplicationController
  def show
    @order = Order.where(user:params[:id])
  end

  def index
  end

  def destroy
    user = User.find(current_user.id)
    user.destroy
    redirect_to root_path
  end
end
