class Admin::ArrivalsController < ApplicationController
  def create
    @item = Item.find(params[:arrival][:item_id])
    @arrival = Arrival.new(arrival_params)
    if @arrival.save
      flash[:success] = "入荷情報の登録に成功しました。"
      redirect_to admin_arrivals_path
    else
      puts @arrival.errors.full_messages
      render "edit"
    end
  end

  def edit
    if admin_signed_in?
    @item = Item.find(params[:id])
    @arrival = Arrival.new
    @disks = Disk.where(item_id: @item.id)
    songs = Song.joins(:@disk).where(disk_id: {item_id: @item.id})
    else
      redirect_to root_path
    end
  end

  def index
    if admin_signed_in?
    @arrivals = Arrival.page(params[:page]).per(20)
    else
    redirect_to root_path
    end
  end


  private
  def arrival_params
    params.require(:arrival).permit(:arrival_quantity, :arrival_date, :item_id)
  end
end
