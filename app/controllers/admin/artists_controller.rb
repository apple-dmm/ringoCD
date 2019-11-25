class Admin::ArtistsController < ApplicationController

  def new
    if admin_signed_in?
  	@artist = Artist.new
    else
    redirect_to root_path
    end
  end

  def create
  	@artist = Artist.new(artist_params)
  if @artist.save
    	redirect_to new_admin_artist_path
    else
      render 'new'
  end
  end

  def edit
    if admin_signed_in?
  	@artist = Artist.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
  	@artist = Artist.find(params[:id])
  	#update_attributesとは?
  	#Hashを引数に渡してデータベースのレコードを複数同時に更新することができるメソッド
    if @artist.update_attributes(artist_params)
    	redirect_to edit_admin_artist_path
    else
      render 'edit'
  end
end

  	 def destroy
    Artist.find(params[:id]).destroy
    flash[:success] = "アーティストを削除しました"
      redirect_to new_admin_artist_path
  end

  private
  def artist_params
  	params.require(:artist).permit(:name)
end
end
