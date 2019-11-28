class ItemsController < ApplicationController

  def show
    if user_signed_in?
    @item = Item.find(params[:id])
    @favorite = Favorite.new
    @user = current_user

    @disks = Disk.where(item_id: @item.id)
    songs = Song.joins(:@disk).where(disk_id: {item_id: @item.id})

    @cart_item = CartItem.new
    @user = User.find(current_user.id)
    @reviews = Review.where(item_id: @item.id)

    @arrivals = Arrival.where(item_id: @item.id)
    @item_orders = ItemOrder.where(item_id: @item.id)
    @total_arrival = 0
    @total_order = 0
      @arrivals.each do |arrival|
        @total_arrival = @total_arrival + arrival.arrival_quantity
      end
      @item_orders.each do |item_order|
        @total_order = @total_order + item_order.quantity
      end
    if @total_arrival - @total_order >= 1
      @item.update_attributes(status: 0)
    else
      @item.update_attributes(status: 1)
    end

  else
    @item = Item.find(params[:id])

    @disks = Disk.where(item_id: @item.id)
    songs = Song.joins(:@disk).where(disk_id: {item_id: @item.id})
    @reviews = Review.where(item_id: @item.id)

    @arrivals = Arrival.where(item_id: @item.id)
    @item_orders = ItemOrder.where(item_id: @item.id)
    @total_arrival = 0
    @total_order = 0
      @arrivals.each do |arrival|
        @total_arrival = @total_arrival + arrival.arrival_quantity
      end
      @item_orders.each do |item_order|
        @total_order = @total_order + item_order.quantity
      end
    if @total_arrival - @total_order >= 1
      @item.update_attributes(status: 0)
    else
      @item.update_attributes(status: 1)
    end

  end
  end

  def index
    @all_ranks = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(4).pluck(:item_id))

  	@search = Item.includes(:artist).ransack(params[:q])
    @items = @search.result.page(params[:page]).per(30)
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :user_id, :item_id)
  end

  def favorite_params
    params.require(:favorite).permit(:user_id, :item_id)
  end

end
