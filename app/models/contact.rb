class Contact < ApplicationRecord
	has_many :replies
	belongs_to :user

	validates :title, presence: true
	validates :body, presence: true
acts_as_paranoid
end
