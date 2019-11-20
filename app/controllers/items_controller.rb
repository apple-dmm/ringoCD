class ItemsController < ApplicationController
  def show
  end

  def index
  	 @q = Item.ransack(params[:q])
    @q.build_condition if @q.conditions.empty?
    @items = @q.result(distinct: true).page(params[:page]).per(30)
     #@items = Item.all

  end
end
