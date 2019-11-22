class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @item.price = @item.price*1.1
    @disks = Disk.where(item_id: @item.id)
    songs = Song.joins(:@disk).where(disk_id: {item_id: @item.id})

    @cart_item = CartItem.new
    @user = User.find(current_user.id)
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to cart_items_path
    else
      render 'show'
    end
  end

  def index
  	@q = Item.ransack(params[:q])
    @q.build_condition if @q.conditions.empty?
    @items = @q.result(distinct: true).page(params[:page]).per(30)

     #@items = Item.all
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :user_id, :item_id)


  end

end
