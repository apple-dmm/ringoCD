class Address < ApplicationRecord
	belongs_to :user
	has_many :orders
	accepts_nested_attributes_for :orders
end
