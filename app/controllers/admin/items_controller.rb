class Admin::ItemsController < ApplicationController
  def index
    @q = Item.ransack(params[:q])
    @q.build_condition if @q.conditions.empty?
    @items = @q.result(distinct: true).page(params[:page]).per(30)
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

  def autocomplete_artist
    artist_suggestions = Artist.autocomplete(params[:term]).pluck(:name)
    respond_to do |format|
      format.html
      format.json{
        render json: artist_suggestions
      }
    end
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
