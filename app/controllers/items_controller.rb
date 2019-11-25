class ItemsController < ApplicationController

  def show
    if user_signed_in?
    @item = Item.find(params[:id])
    @favorite = Favorite.new
    @user = current_user

    @item.price = @item.price*1.1
    @disks = Disk.where(item_id: @item.id)
    songs = Song.joins(:@disk).where(disk_id: {item_id: @item.id})

    @cart_item = CartItem.new
    @user = User.find(current_user.id)
    @reviews = Review.where(item_id: @item.id)

  else
    @item = Item.find(params[:id])

    @item.price = @item.price*1.1
    @disks = Disk.where(item_id: @item.id)
    songs = Song.joins(:@disk).where(disk_id: {item_id: @item.id})
    @reviews = Review.where(item_id: @item.id)
  end
  end

  def index
  	@q = Item.ransack(params[:q])
    @q.build_condition if @q.conditions.empty?
    @items = @q.result(distinct: true).page(params[:page]).per(30)
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :user_id, :item_id)
  end

  def favorite_params
    params.require(:favorite).permit(:user_id, :item_id)
  end

end
