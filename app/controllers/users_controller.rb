class UsersController < ApplicationController
  def show
  	#"user/:id"のidには文字列も入るので、注意
  	@user = User.find(params[:id])
  end

  def exit
  end

  def edit
  end
end
