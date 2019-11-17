class CartItemsController < ApplicationController
  def index
  	@cart_items = CartItem.all
  end

  def destroy
  end

  def update
  end

end
