class Admin::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  end

  private
  def order_params
  	params.require(:order).permit(:name, :user_id, :postal_code, :address, :payment, :total, :delivery_status, :delivery_fee)
  end

end
