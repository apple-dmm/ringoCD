class Contact < ApplicationRecord
	has_many :replies
	belongs_to :end_user
end
