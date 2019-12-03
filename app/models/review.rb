class Review < ApplicationRecord
	belongs_to :item
	belongs_to :user
acts_as_paranoid
end
