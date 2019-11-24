class Admin::ReviewsController < ApplicationController

  def edit
  	@review = Review.find(params[:id])
  end

  def update
  	@review = Review.find(params[:id])
  	if @review.update(review_params)
  		flash[:success] = "レビューの編集が完了しました。"
  		redirect_to admin_item_path(@review.item.id)
  	else
  		render "edit"
  	end
  end

  def destroy
  	@review = Review.find(params[:id])
  	if @review.destroy
  		redirect_to admin_item_path(@review.item.id)
  	end
  end


  private
  def review_params
  	params.require(:review).permit(:title, :body, :rate)
  end

end



  def create
    item = Item.find(params[:id])
    @review = item.reviews.create(review_params)
  	@review.user_id = current_user.id
  	if @review.save
  		redirect_to orders_path
  	else
  		puts @review.errors.full_messages
  		render :new
  	end
  end