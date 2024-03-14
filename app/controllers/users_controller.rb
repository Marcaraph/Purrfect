class UsersController < ApplicationController
  def show
    @order = Order.where(user: current_user)
  end

  def index
  end

  def destroy
    # if params[:current_password] != current_user.password
      user = User.find(current_user.id)
      user.destroy
      redirect_to root_path
    # end

  end
end
