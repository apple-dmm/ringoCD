class UsersController < ApplicationController
  def show
  	#"user/:id"のidには文字列も入るので、注意
  	@user = User.find(params[:id])
  end

  def exit
  	@user = User.find(params[:id])
  end

  def edit
    @user = current_user
    @address = @user.addresses
    @addresses = @user.addresses
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:notice] = "アカウント情報の更新に成功しました。"
      redirect_to user_path(user.id)
    else
      render "edit"
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_furigana,
      :first_furigana, :postal_code, :address, :phone_number, :email,
      addresses_attributes: [:id, :name, :address, :_destroy ])
  end
  def password_params
    params.require(:user).permit(:password,:password_confirmation)
  end

  def currect_user
    @user = User.find(params[:id])
    if @user != current_user
        redirect_to user_path(current_user.id)
    end
  end

end
