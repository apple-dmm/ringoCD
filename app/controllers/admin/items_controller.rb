class Admin::ItemsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
    @item = Item.new
    @disk = @item.disks.build
    @song = @disk.songs.build

  end

  def create
    @item = Item.new
    if @item.save
    else
  end
  end

  private
  #cocoon用記述。_destroyがないと削除できない。
  def item_params
    params.require(:item).permit(:name, :price, :release, 
      disks_attributes: [:id, :disk_num, :_destroy, 
        songs_attribute: [:id, :name, :setlist, :_destroy]])
  end
end
