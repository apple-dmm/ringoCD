class Admin::ItemsController < ApplicationController

  def index
    @q = Item.ransack(params[:q])
    @q.build_condition if @q.conditions.empty?
    @item_result = @q.result(distinct: true).page(params[:page]).per(30)
  end

  def show
    @item = Item.find(params[:id])
    @disks = Disk.where(item_id: @item.id)
    songs = Song.joins(:@disk).where(disk_id: {item_id: @item.id})
  end

  def edit
    @item = Item.find(params[:id])
    @disk = @item.disks.build
    @song = @disk.songs.build
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

  def autocomplete_category
    category_suggestions = Category.autocomplete(params[:term]).pluck(:name)
    respond_to do |format|
      format.html
      format.json{
        render json: category_suggestions
      }
    end
  end

  def autocomplete_label
    label_suggestions = Label.autocomplete(params[:term]).pluck(:name)
    respond_to do |format|
      format.html
      format.json{
        render json: label_suggestions
      }
    end
  end

  def create
    @artist = Artist.find_by(name: params[:item][:artist_id])
    @label = Label.find_by(name: params[:item][:label_id])
    @category = Category.find_by(name: params[:item][:category_id])

    @item = Item.new(item_params)
    @item.artist_id = @artist.id
    @item.label_id = @label.id
    @item.category_id = @category.id
    if @item.save
      redirect_to new_admin_item_path
    else
      render 'new'
  end
  end

  def update
    @artist = Artist.find_by(name: params[:item][:artist_id])
    @label = Label.find_by(name: params[:item][:label_id])
    @category = Category.find_by(name: params[:item][:category_id])

    @item = Item.find(params[:id])
    @item.artist_id = @artist.id
    @item.label_id = @label.id
    @item.category_id = @category.id
    if @item.update(item_params)
      redirect_to admin_item_path(params[:id])
    else
      puts @item.errors.full_messages
      render 'edit'
  end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admin_items_path
  end


  private
  #cocoon用記述。_destroyがないと削除できない。
  def item_params
    params.require(:item).permit(:name, :price, :release, :image, 
      disks_attributes: [:id, :disk_num, :_destroy,
        songs_attributes: [:id, :name, :setlist, :_destroy]])
  end
end
