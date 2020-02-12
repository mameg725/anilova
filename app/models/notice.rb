class Notice < ApplicationRecord
	belongs_to :user
	belongs_to :favorite
	belongs_to :post_comment
	belongs_to :news
end
