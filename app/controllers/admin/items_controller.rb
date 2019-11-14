class Admin::ItemsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
    @item = Item.new
    @song = Song.new
  end

  def create
    @item = Item.new
    if @item.save
    redirect_to
    else
    render new
  end
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :release)
  end

  def song_params
    params.require(:song).permit(:name, :setlist, :disk_num)
  end
end
