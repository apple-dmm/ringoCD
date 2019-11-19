class Admin::ArrivalsController < ApplicationController
  def create
    @item = Item.find(params[:arrival][:item_id])
    @arrival = Arrival.new(arrival_params)
    if @arrival.save
      flash[:success] = "入荷情報の登録に成功しました。"
      redirect_to edit_admin_item_path(@item.id)
    else
      puts @arrival.errors.full_messages
      render "edit"
    end
  end

  def edit
    @item = Item.find(params[:id])
    @arrival = Arrival.new
    @disks = Disk.where(item_id: @item.id)
    songs = Song.joins(:@disk).where(disk_id: {item_id: @item.id})
  end

  def index
    @arrivals = Arrival.page(params[:page]).per(20)
  end


  private
  def arrival_params
    params.require(:arrival).permit(:arrival_quantity, :arrival_date, :item_id)
  end
end
