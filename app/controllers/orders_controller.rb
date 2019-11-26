class OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).reverse_order
    @user = current_user
  end

  def new
  	@user = current_user
  	@order = Order.new
  	@order.build_user
    @delivery_fee = @order.delivery_fee
    @item_order = @order.item_orders.build
  	@addresses = @user.addresses
    @cart_items = CartItem.all
    @order_pay = Payjp::Charge.new
    @total_price = 0
    @cart_items.each do |cart_item|
      item = Item.where(id: cart_item.item_id)
      @total_price = @total_price + cart_item.item.include_tax_price * cart_item.quantity
    end
    @total_quantity = @cart_items.sum(:quantity)
  end



  def confirm
  end

  def create
    unless params['payjp-token'].blank?
      Payjp.api_key = 'sk_test_46e2a7941c4d2d62892e6ee9' # 秘密鍵 環境変数化しましょう
        charge = Payjp::Charge.create(
        :amount => params[:order][:total],
        :card => params['payjp-token'],
        :currency => 'jpy',
        )
    end
      @order = Order.new(order_params)
      @cart_items = CartItem.all
      if params['add_address'] == "other"
        @user = Address.create(
        user_id: current_user.id,
        last_name: params[:order][:address][:name],
        postal_code: params[:order][:address][:postal_code],
        address: params[:order][:address][:address]
        )
        @order.order_address = params[:order][:address][:order_address]
        @order.postal_code = params[:order][:address][:postal_code]
        @order.name = params[:order][:address][:name]
      elsif params['add_address'] == "me"
        @user = current_user
        @order.order_address = @user.residence
        @order.postal_code = @user.postal_code
        @order.name = @user.last_name
      else
        @address = Address.find(params[:add_address].to_i)
        @order.order_address = @address.address
        @order.postal_code = @address.postal_code
        @order.name = @address.name
      end
      if params['order']['payment'] == "クレジット"
        @order.payment = 0
      elsif params['order']['payment'] == "銀行振込"
        @order.payment = 1
      else
        @order.payment = 2
      end
      @order.user_id = current_user.id
      if @order.save
        @cart_items.each do |cart_item|
          @item_order = @order.item_orders.build
          @item_order.item_id = cart_item.item.id
          @item_order.quantity = cart_item.quantity
          @item_order.price = cart_item.item.include_tax_price
          @item_order.save
        end
        @cart_items.destroy_all
        redirect_to order_complete_path
      else
        @user = current_user
        render :new
      end
  end

  private
  def order_params
    params.require(:order).permit(:name,:delivery_fee,:total,:postal_code,:card_num, :card_name, :securitycode,:payment,:order_address, address_attributes:[:id,:name,:address, :postal_code,:deleted_at],item_order_attributes:[:id,:item_id,:quantity,:price])

  end
end