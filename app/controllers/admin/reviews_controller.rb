class Admin::ReviewsController < ApplicationController
  def edit
  	@review = Review.find(:id)
  end

  private
  def review_params
  	params.require(:review).permit(:title, :body, :rate)
  end

end
