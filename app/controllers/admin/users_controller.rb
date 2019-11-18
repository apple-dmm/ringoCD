class Admin::UsersController < ApplicationController
  def index
  	@user = User.all
  	@q = User.ransack(params[:q])
    @q.build_condition if @q.conditions.empty?
    @users = @q.result(distinct: true).page(params[:page]).per(30)
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  private
  #cocoon用記述。_destroyがないと削除できない。
  def user_params
    params.require(:user).permit(:name, :postal_code, :phone_number, :encrypted_password)
  end
end
