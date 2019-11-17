class Admin::LabelsController < ApplicationController

  def new
  	@label = Label.new
  end

  def create
  	@label = Label.new(label_params)
  if @label.save
    	redirect_to new_admin_label_path
    else
      render 'new'
  end
  end

  def edit
  	@label = Label.find(params[:id])
  end

  def update
  	@label = Label.find(params[:id])
  	#update_attributesとは?
  	#Hashを引数に渡してデータベースのレコードを複数同時に更新することができるメソッド
    if @label.update_attributes(label_params)
    	redirect_to edit_admin_label_path
    else
      render 'edit'
  end
  end

  	 def destroy
    Label.find(params[:id]).destroy
    flash[:success] = "アーティストを削除しました"
      redirect_to new_admin_label_path
  end

  private
  def label_params
  	params.require(:label).permit(:name)
end
end
