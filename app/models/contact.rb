class Contact < ApplicationRecord
	has_many :replies
	belongs_to :user
acts_as_paranoid
end
