class OrdersController < ApplicationController
  def new
    @total_cart = CartItem.where(cart: current_user.cart)
    @stripe_amount = @total_cart.sum(&:price).to_f
  end

  def create

  end
end
