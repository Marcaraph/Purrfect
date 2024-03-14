class CartItemsController < ApplicationController
  
  def new
  end
  
  def create
    item = Item.friendly.find(params[:item])
    puts item
    puts current_user
    @CartItem = CartItem.new(price: item.price, cart: current_user.cart, item: item)

    respond_to do |format|
        if @CartItem.save
          format.html { redirect_back fallback_location: root_path, notice: "Item was successfuly added to yout cart." }
          format.json { render :show, status: :created, location: @CartItem }
        end
    end
  
  end

  def destroy

    cart_item = CartItem.find(params[:id])
    # @current_cart.update(price: @current_cart.price - cart_item.price)
    cart_item.destroy
    redirect_back fallback_location: root_path
    # cart_item = current_user.cart.cart_items.find(params[:item])
    # cart_item.destroy
    # redirect_back fallback_location: root_path

  end
end
