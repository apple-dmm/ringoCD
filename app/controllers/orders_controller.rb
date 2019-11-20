class OrdersController < ApplicationController
  def index
  	@orders = Order.page(params[:page]).reverse_order
    @user = current_user
  end

  def new
  	@user = current_user
  	@order = Order.new
  	@order.addresses.build
  	@addresses = Address.all
  end

  def create
  	@order = Order.new(order_params)
  	@order.user_id = current_user.id
    if @order.save
  	   redirect_to confirm_order_path
  	else
  		@user = current_user
  		render :new
  	end
  end

  def confirm
  end

  private
  def order_params
    params.require(:order).permit(:name,:card_num, :card_name, :securitycode, address_attributes:[:id, :postal_code, :address,:name])
  end
end
