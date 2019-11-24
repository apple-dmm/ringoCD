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
    if params[:order_button]
      @order = Order.new(order_params)
      @cart_items = CartItem.all
      @user = current_user
      @order.user_id = current_user.id
      @addresses = @user.addresses
      @user.addresses.build(name: params[:order][:name], postal_code: params[:order][:postal_code], address: params[:order][:order_address])

    else
      Payjp.api_key = 'sk_test_46e2a7941c4d2d62892e6ee9' # 秘密鍵 環境変数化しましょう
      charge = Payjp::Charge.create(
          :amount => 3500, #ベタ打ちしてるので変える
          :card => params['payjp-token'],
          :currency => 'jpy',
      )
    end
      @order = Order.new(order_params)
      @cart_items = CartItem.all
      @user = current_user
      @items = CartItem.all
      @addresses = @user.addresses
      @user.addresses.build(name: params[:order][:name], postal_code: params[:order][:postal_code], address: params[:order][:order_address])
      @order.user_id = current_user.id

      @cart_items.each do |cart_item|
        @item_order = @order.item_orders.build
        @item_order.item_id = cart_item.item.id
        @item_order.quantity = cart_item.quantity
        @item_order.price = cart_item.item.include_tax_price
      end
      if params['add_address'] == "1"
        Address.create(
          user_id: current_user.id,
          name: params[:order][:address][:name],
          postal_code: params[:order][:address][:postal_code],
          address: params[:order][:address][:address]
          )
        @order.order_address = params[:order][:address][:order_address]
        @order.postal_code = params[:order][:address][:postal_code]
        @order.name = params[:order][:address][:name]
      else
        @order.order_address = @user.residence
        @order.postal_code = @user.postal_code
        @order.name = @user.last_name
      end

      if @order.save
        @cart_items.destroy_all
         redirect_to order_complete_path
      else
        puts @order.errors.full_messages
        @user = current_user
        render :new
      end
    end

  private
  def order_params
    params.require(:order).permit(:name,:delivery_fee,:total,:postal_code,:card_num, :card_name, :securitycode,:payment,:order_address, address_attributes:[:id,:name,:address, :postal_code,:deleted_at],item_order_attributes:[:id,:item_id,:quantity,:price])

  end
end