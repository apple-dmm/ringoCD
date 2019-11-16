class OrdersController < ApplicationController
  def index
  	@orders = Order.page(params[:page]).reverse_order
  end

  def new
  	@user = current_user
  	@credit_num = Credit.new
  end

  def confirm
  end
end
