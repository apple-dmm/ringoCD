class Admin::OrdersController < ApplicationController
  def index
  	@q = Order.ransack(params[:q])
    @order_results = @q.result(distinct: true).page(params[:page]).per(30)

   	@total_quantity = 0

  end

  def update
  	@order = Order.find(params[:id])
  	if @order.update(order_params)
  		redirect_to admin_orders_path
  	else
  		render 'index'
  	end
  end



  def show
  	@order = Order.find(params[:id])
  end

  private
  def order_params
  	params.require(:order).permit(:name, :user_id, :postal_code, :order_address, :payment, :total, :delivery_status, :delivery_fee)
  end

end
