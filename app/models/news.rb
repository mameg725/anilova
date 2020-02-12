class News < ApplicationRecord
	has_many :notices, dependent: :destroy
	belongs_to :user
end
