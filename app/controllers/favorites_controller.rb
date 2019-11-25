class FavoritesController < ApplicationController

      def index
       @favorites = Favorite.where(user_id: current_user.id)
       @cart_item = CartItem.new
       @favorites = Favorite.page(params[:page]).per(7)
      end

      def create
      	@item = Item.find(params[:item_id])
        @favorite = Favorite.new
        @favorite.item_id = @item.id
        @favorite.user_id = current_user.id
        @favorite.save
        redirect_to item_path(@item), notice: "お気に入りに登録しました"
      end

      def destroy
        #@favorite = Favorite.where(user_id: current_user.id).where(item_id:params[:item_id])
        @item = Item.find(params[:item_id])
      	@favorite = Favorite.find_by(item_id: params[:id], user_id: current_user.id)
        @favorite.destroy
        redirect_to item_path(@item)
     end

     def destroy_all
      @favorites = Favorite.where(id: params[:favorites])
      @favorites.destroy_all
      redirect_to favorites_path
     end

     private
        def favorite_params
          params.require(:favorite).permit(:item_id, :user_id)
        end
end
