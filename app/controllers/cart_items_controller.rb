class CartItemsController < ApplicationController
  def index
  	@cart_items = CartItem.all
  end


  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to item_path(params[:cart_item][:item_id])
    else
      @cart_items = CartItem.all
      render 'index'
    end
  end

  def destroy
  end

  def update
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :user_id, :item_id)
  end

end
