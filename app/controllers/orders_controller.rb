class OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).reverse_order
    @user = current_user
  end

  def new
    @user = current_user
    @order = Order.new
    @addresses = @user.addresses
    @order_pay = Payjp::Charge.new
  end

  def create
    if params[:order_button]
      @order = Order.new(order_params)
      @user = current_user
      @order.user_id = current_user.id
      @addresses = @user.addresses
      @user.addresses.build(name: params[:order][:name], postal_code: params[:order][:postal_code], address: params[:order][:order_address])
      if @order.save
         redirect_to order_complete_path
      else
        @user = current_user
        render :new
      end
    else
      Payjp.api_key = 'sk_test_46e2a7941c4d2d62892e6ee9' # 秘密鍵 環境変数化しましょう
      charge = Payjp::Charge.create(
          :amount => 3500, #ベタ打ちしてるので変える
          :card => params['payjp-token'],
          :currency => 'jpy',
      )
      @order = Order.new(order_params)
      @order.user_id = current_user.id
      if @order.save
         redirect_to order_complete_path
      else
        @user = current_user
        render :new
      end
    end
  end

  private
  def order_params
    params.require(:order).permit(:name, :postal_code, :order_address,:card_num, :card_name, :securitycode)
  end
end


