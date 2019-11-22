class OrdersController < ApplicationController
  def index
  	@orders = Order.page(params[:page]).reverse_order
    @user = current_user
  end

  def new
  	@user = current_user
  	@order = Order.new
  	@order.build_user
    @item_order = @order.item_orders.build
  	@addresses = Address.all
    @cart_items = CartItem.all
  end

  def create
  	@order = Order.new(order_params)
    @cart_items = CartItem.all
    @user= current_user
  	@order.user_id = current_user.id

    @cart_items.each do |cart_item|
    @item_order = @order.item_orders.build
    @item_order.item_id = cart_item.item.id
  end
  if @order.save
    @cart_items.destroy_all
  	redirect_to confirm_order_path
  else
       puts @order.errors.full_messages
  		 @user = current_user
  		 render :new
      end
  end

  def confirm
  end

  private
  def order_params
    params.require(:order).permit(:name,:card_num, :card_name, :securitycode, user_attributes:[:id,:last_name, :postal_code, :address, :deleted_at],item_order_attributes:[:id,:item_id,:quantity,:price])
  end
end