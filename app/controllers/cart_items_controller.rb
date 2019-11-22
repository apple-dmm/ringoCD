class CartItemsController < ApplicationController
  def index
  	@cart_items = CartItem.all
  	@total_price = 0
  	@cart_items.each do |cart_item|
  		item = Item.where(id: cart_item.item_id)
  		@total_price = @total_price + cart_item.item.include_tax_price * cart_item.quantity
 	end
  	@total_quantity = @cart_items.sum(:quantity)
  end


  def create
  	@item = Item.find(params[:cart_item][:item_id])
  	@cart_items = CartItem.find_by(item_id: @item.id)
  	if !@cart_items.nil?
		@cart_items.quantity = @cart_items.quantity + params[:cart_item][:quantity].to_i
		@cart_items.save
		redirect_to item_path(params[:cart_item][:item_id])
  	elsif @cart_items.nil?
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.save
      redirect_to item_path(params[:cart_item][:item_id])
  end
  end

  def destroy
  	@cart_items = CartItem.find_by(item_id: params[:id])
    @cart_items.destroy
    redirect_to cart_items_path
  end

  def update
  	@cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      render 'index'
  end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :user_id, :item_id)
  end

end
