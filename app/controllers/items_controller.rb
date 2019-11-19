class ItemsController < ApplicationController
  def show
  end

  def index
  	 @q = Item.ransack(params[:q])
    @q.build_condition if @q.conditions.empty?
    @items = @q.result(distinct: true).page(params[:page]).per(30)
  end

   def autocomplete_artist
    artist_suggestions = Artist.autocomplete(params[:term]).pluck(:name)
    respond_to do |format|
      format.html
      format.json{
        render json: artist_suggestions
      }
    end
  end
end
