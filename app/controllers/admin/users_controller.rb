class Admin::UsersController < ApplicationController
  def index
    if admin_signed_in?
  	@search = User.ransack(params[:q])
    @user_result = @search.result
  else
    redirect_to root_path
  end
  end

  def show
    if admin_signed_in?
  	@user = User.find(params[:id])
  else
    redirect_to root_path
  end
  end

  def edit
    if admin_signed_in?
  	@user = User.find(params[:id])
  else
    redirect_to root_path
  end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  private
  #cocoon用記述。_destroyがないと削除できない。
  def user_params
    params.require(:user).permit(:email,:name, :postal_code, :phone_number, :encrypted_password)
  end
end
