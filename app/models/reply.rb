class Reply < ApplicationRecord
	belongs_to :contact
acts_as_paranoid
end
