class Favorite < ApplicationRecord
	has_many :notices, dependent: :destroy
	belongs_to :user
	belongs_to :post
end
