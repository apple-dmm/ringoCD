class Favorite < ApplicationRecord


	belongs_to :user
	belongs_to :item
	validates_uniqueness_of :item_id, scope: :user_id


	acts_as_paranoid
  def favorited_by?(user,item)
    Favorite.where(user_id: user.id).where(item_id: item.id).exists?
  end

end

